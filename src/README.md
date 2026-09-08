# NL2SQL Baseline

## What this is

A zero-shot LLM-prompting NL2SQL baseline: the target database's schema (real `CREATE TABLE` DDL, pulled directly from the `.sqlite` file), any available column-semantics hints (from `database_description/`), and the question's `evidence` field (if present) are placed into a single prompt asking the model to produce one SQL query — no few-shot exemplars, no schema-linking stage, no self-correction loop.

This is the same baseline category that the DIN-SQL and DAIL-SQL papers themselves report as their simplest comparison point ("Zero-Shot"). Real implementations of DIN-SQL, DAIL-SQL, and CodeS were found locally under `nl2sql_debugger/benchmark/datasets/spider2/spider2-lite/baselines/`, but all three require a paid OpenAI API key and are preprocessed specifically for Spider 2.0's own file layout. Since no paid API key is configured in this environment, `nl2sql_baseline.py` instead uses a local **Ollama `llama3.1:8b`** model as its LLM backend (free, no external cost) and reads directly from this repository's own benchmark folder format (`databases/`, `database_description/`, `nl_queries.json`, `gold.sql`), so it runs unmodified against all three benchmarks.

## Usage

Requires a running local Ollama server with `llama3.1:8b` pulled (`ollama pull llama3.1:8b`).

```bash
python3 nl2sql_baseline.py <benchmark_dir> <output_dir> [--limit N] [--start N] [--workers N]
```

Results are written to `<output_dir>/<benchmark_name>_results.json`, one object per question with the predicted SQL, gold SQL, execution errors (if any), and a `match` boolean (Execution Accuracy). The script checkpoints every 20 questions and resumes automatically if interrupted and re-run.

## Results

Full run across all three benchmarks (1,856 questions total), single pass, temperature 0, 4 parallel workers, 20-second execution timeout per query.

| Benchmark | EX | Questions |
|---|---|---|
| **bird-dev** | **38.07%** | 584/1534 |
| **science-benchmark** | **34.45%** | 103/299 |
| **spider2.0-lite** | **4.35%** | 1/23 |

### bird-dev, per database

| Database | EX |
|---|---|
| superhero | 62.0% (80/129) |
| student_club | 58.9% (93/158) |
| european_football_2 | 48.8% (63/129) |
| toxicology | 44.8% (65/145) |
| codebase_community | 44.6% (83/186) |
| card_games | 32.5% (62/191) |
| debit_card_specializing | 31.2% (20/64) |
| formula_1 | 27.6% (48/174) |
| financial | 25.5% (27/106) |
| thrombosis_prediction | 18.4% (30/163) |
| california_schools | 14.6% (13/89) |

### science-benchmark, per database

| Database | EX |
|---|---|
| oncomx | 49.5% (49/99) |
| cordis | 44.0% (44/100) |
| sdss | 10.0% (10/100) |

### spider2.0-lite, per database

1/23 correct overall (`EntertainmentAgency`, 1/1). All other databases in this curated subset scored 0 — expected, since this subset was specifically scoped to gold-verified examples from Spider 2.0-Lite's hardest tier (multi-CTE, window-function pipelines); even GPT-4o/o3 with sophisticated agentic scaffolding only reaches ~38–42% EX on this same local-SQLite subset (see `datasets/spider2.0-lite/description.md`), so a small local 8B model with a single zero-shot pass scoring near zero is expected, not a bug.

## Interpreting these numbers

- **bird-dev's 38.07%** is directly comparable to the original BIRD paper's own zero-shot ChatGPT baseline (40.08% EX) — a local 8B model landing close to that is a reasonable, expected result and a useful sanity check that the benchmark folder is genuinely usable end-to-end.
- **science-benchmark's 34.45%** is well below the published training-free SOTA (59.53% EX, DeepSeek-V3 + TA-SQL, a much larger model with task-alignment prompting) — expected, since this baseline uses neither a larger model nor any scaffolding beyond a single zero-shot prompt.
- **spider2.0-lite's 4.35%** reflects that this repository's curated subset is deliberately the *hardest*, fully gold-verified slice of Spider 2.0-Lite, not a representative sample — see that benchmark's own `description.md` for why.

### Execution-timeout caveat (methodology note, not a benchmark defect)

Both the predicted SQL and the gold SQL were executed with the same 20-second timeout under 4-way concurrent load (to keep the full run tractable). 15 gold queries hit this timeout during the run (2 in `bird-dev`, 11 in `science-benchmark`'s `sdss`, which has a 76.8M-row table) even though all of them were independently confirmed to execute successfully without a timeout during this repository's own consistency validation (see the top-level conversation / `datasets/*/description.md`). These 15 cases were automatically scored as non-matches by this harness (since the gold result was unavailable to compare against) — this is a limitation of this baseline script's timeout/concurrency settings, not evidence of a problem with the benchmark data itself. The only genuine gold-SQL errors encountered were the 2 previously-documented OncoMX authoring bugs (question_id 293 and 298), which are already disclosed in `datasets/science-benchmark/description.md`.

### Predicted-SQL error rates

| Benchmark | Predicted SQL raised an execution error |
|---|---|
| bird-dev | 23.5% (360/1534) |
| science-benchmark | 21.7% (65/299) |
| spider2.0-lite | 47.8% (11/23) |

Full per-question output (predicted SQL, gold SQL, errors, timing) is in `results/*.json` for inspection.
