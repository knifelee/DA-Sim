"""
Zero-shot LLM-prompting NL2SQL baseline.

This is the same baseline category that DIN-SQL / DAIL-SQL papers report as
their simplest comparison point ("Zero-Shot"): the database schema (as real
CREATE TABLE DDL from the target .sqlite file), any column-semantics hints
from database_description/, and the evidence field (if present) are placed
directly into a prompt asking an LLM to produce one SQL query, with no
few-shot exemplars, no schema-linking stage, and no self-correction loop.

Reference baselines found locally under
`nl2sql_debugger/benchmark/datasets/spider2/spider2-lite/baselines/`
(DIN-SQL, DAIL-SQL, CodeS) all require a paid OpenAI API key and are
preprocessed specifically for Spider 2.0's own file layout. Since no paid
API key is configured in this environment, this implementation uses a local
Ollama model as the LLM backend instead, and works directly against this
repository's own benchmark folder format (databases/, database_description/,
nl_queries.json, gold.sql) so it can run unmodified against bird-dev,
science-benchmark, and spider2.0-lite.

Usage:
    python3 nl2sql_baseline.py <benchmark_dir> <output_dir> [--limit N] [--start N] [--workers N]

Example:
    python3 nl2sql_baseline.py ../datasets/bird-dev results/bird-dev
"""
import argparse
import csv
import json
import os
import re
import sqlite3
import sys
import threading
import time
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed

MODEL = "llama3.1:8b"
OLLAMA_URL = "http://localhost:11434/api/generate"
EXEC_TIMEOUT_SEC = 20
GEN_TIMEOUT_SEC = 120


def load_schema_ddl(sqlite_path):
    conn = sqlite3.connect(sqlite_path)
    cur = conn.cursor()
    cur.execute("SELECT sql FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'")
    ddls = [r[0] for r in cur.fetchall() if r[0]]
    conn.close()
    return "\n\n".join(ddls)


def load_value_hints(desc_dir, max_chars=3000):
    if not os.path.isdir(desc_dir):
        return ""
    lines = []
    for fn in sorted(os.listdir(desc_dir)):
        if not fn.endswith(".csv"):
            continue
        table = fn[:-4]
        path = os.path.join(desc_dir, fn)
        try:
            with open(path, encoding="utf-8-sig", errors="ignore") as f:
                reader = csv.DictReader(f)
                for row in reader:
                    col = (row.get("original_column_name") or "").strip()
                    desc = (row.get("column_description") or "").strip()
                    val = (row.get("value_description") or "").strip()
                    if not col or not (desc or val):
                        continue
                    piece = f"{table}.{col}: "
                    if desc and desc.lower() != col.lower():
                        piece += desc
                    if val:
                        piece += f" ({val})" if desc else val
                    lines.append(piece)
        except Exception:
            continue
    text = "\n".join(lines)
    return text[:max_chars]


def build_prompt(schema_ddl, hints, question, evidence):
    prompt = f"""You are an expert SQLite query writer. Given the database schema, optional column hints, a question, and optional evidence, write ONE valid SQLite SQL query that answers the question.

### Schema:
{schema_ddl}
"""
    if hints:
        prompt += f"\n### Column hints (semantics of columns/values):\n{hints}\n"
    prompt += f"\n### Question:\n{question}\n"
    if evidence:
        prompt += f"\n### Evidence:\n{evidence}\n"
    prompt += "\nRespond with ONLY the SQL query, no explanation, no markdown fences.\nSQL:"
    return prompt


def call_ollama(prompt, retries=2):
    payload = json.dumps({
        "model": MODEL,
        "prompt": prompt,
        "stream": False,
        "options": {"temperature": 0},
    }).encode("utf-8")
    last_err = None
    for attempt in range(retries + 1):
        try:
            req = urllib.request.Request(OLLAMA_URL, data=payload, headers={"Content-Type": "application/json"})
            with urllib.request.urlopen(req, timeout=GEN_TIMEOUT_SEC) as resp:
                data = json.loads(resp.read())
                return data.get("response", "")
        except Exception as e:
            last_err = e
            time.sleep(1)
    return f"__ERROR__: {last_err}"


def extract_sql(text):
    text = text.strip()
    m = re.search(r"```(?:sql)?\s*(.*?)```", text, re.DOTALL | re.IGNORECASE)
    if m:
        text = m.group(1).strip()
    return text.strip()


def exec_with_timeout(db_path, sql, timeout=EXEC_TIMEOUT_SEC):
    """Execute sql against db_path, aborting via conn.interrupt() if it runs
    longer than `timeout` seconds (protects against pathological queries on
    the very large science-benchmark tables)."""
    result = {"rows": None, "error": None}

    def worker(conn):
        try:
            cur = conn.cursor()
            cur.execute(sql)
            result["rows"] = cur.fetchall()
        except Exception as e:
            result["error"] = str(e)

    conn = sqlite3.connect(db_path, check_same_thread=False)
    t = threading.Thread(target=worker, args=(conn,))
    t.start()
    t.join(timeout)
    if t.is_alive():
        conn.interrupt()
        t.join(5)
        result["error"] = f"TIMEOUT (> {timeout}s)"
    conn.close()
    return result["rows"], result["error"]


def result_match(pred_rows, gold_rows):
    if pred_rows is None or gold_rows is None:
        return False
    try:
        return set(map(tuple, pred_rows)) == set(map(tuple, gold_rows))
    except TypeError:
        return sorted(map(str, pred_rows)) == sorted(map(str, gold_rows))


def process_one(item, gold_sql, bench_dir):
    db_id = item["db_id"]
    question = item["question"]
    evidence = item.get("evidence", "") or ""
    db_path = os.path.join(bench_dir, "databases", db_id, f"{db_id}.sqlite")
    desc_dir = os.path.join(bench_dir, "databases", db_id, "database_description")

    schema_ddl = load_schema_ddl(db_path)
    hints = load_value_hints(desc_dir)
    prompt = build_prompt(schema_ddl, hints, question, evidence)

    t0 = time.time()
    raw = call_ollama(prompt)
    gen_time = time.time() - t0
    pred_sql = extract_sql(raw) if not raw.startswith("__ERROR__") else raw

    pred_rows, pred_err = (None, raw) if raw.startswith("__ERROR__") else exec_with_timeout(db_path, pred_sql)
    gold_rows, gold_err = exec_with_timeout(db_path, gold_sql)

    match = result_match(pred_rows, gold_rows)
    return {
        "question_id": item["question_id"],
        "db_id": db_id,
        "difficulty": item.get("difficulty", ""),
        "pred_sql": pred_sql,
        "gold_sql": gold_sql,
        "pred_error": pred_err,
        "gold_error": gold_err,
        "match": match,
        "gen_time_sec": round(gen_time, 2),
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("benchmark_dir")
    ap.add_argument("output_dir")
    ap.add_argument("--limit", type=int, default=None)
    ap.add_argument("--start", type=int, default=0)
    ap.add_argument("--workers", type=int, default=3)
    ap.add_argument("--checkpoint-every", type=int, default=20)
    args = ap.parse_args()

    bench_dir = os.path.abspath(args.benchmark_dir)
    bench_name = os.path.basename(bench_dir.rstrip("/"))
    os.makedirs(args.output_dir, exist_ok=True)
    out_path = os.path.join(args.output_dir, f"{bench_name}_results.json")

    nl = json.load(open(os.path.join(bench_dir, "nl_queries.json")))
    gold_lines = open(os.path.join(bench_dir, "gold.sql"), encoding="utf-8").read().splitlines()
    gold_sqls = [line.rsplit("\t", 1)[0] for line in gold_lines]

    end = len(nl) if args.limit is None else min(args.start + args.limit, len(nl))
    indices = list(range(args.start, end))

    results = []
    if os.path.exists(out_path):
        try:
            results = json.load(open(out_path))
            done_qids = {r["question_id"] for r in results}
            indices = [i for i in indices if nl[i]["question_id"] not in done_qids]
            print(f"[{bench_name}] Resuming: {len(results)} already done, {len(indices)} remaining")
        except Exception:
            results = []

    def save():
        json.dump(results, open(out_path, "w"), indent=2)

    print(f"[{bench_name}] Running {len(indices)} questions with {args.workers} workers")
    sys.stdout.flush()

    completed = 0
    with ThreadPoolExecutor(max_workers=args.workers) as ex:
        futures = {ex.submit(process_one, nl[i], gold_sqls[i], bench_dir): i for i in indices}
        for fut in as_completed(futures):
            i = futures[fut]
            try:
                r = fut.result()
            except Exception as e:
                r = {"question_id": nl[i]["question_id"], "db_id": nl[i]["db_id"], "error": str(e), "match": False}
            results.append(r)
            completed += 1
            status = "OK" if r.get("match") else "MISS"
            print(f"[{bench_name}] [{completed}/{len(indices)}] qid={r['question_id']} db={r.get('db_id')} {status}")
            sys.stdout.flush()
            if completed % args.checkpoint_every == 0:
                save()

    save()
    n_match = sum(1 for r in results if r.get("match"))
    n_total = len(results)
    print(f"\n[{bench_name}] DONE. Execution Accuracy (EX): {n_match}/{n_total} = {n_match/n_total*100:.2f}%")


if __name__ == "__main__":
    main()
