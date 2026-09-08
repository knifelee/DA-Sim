# Spider 2.0-Lite: Enterprise Text-to-SQL Benchmark (Local-SQLite Subset)

## 1. Paper Information

- **Title:** Spider 2.0: Evaluating Language Models on Real-World Enterprise Text-to-SQL Workflows
- **Authors:** Fangyu Lei, Jixuan Chen, Yuxiao Ye, et al.
- **Venue:** International Conference on Learning Representations (ICLR 2025, Oral)
- **arXiv:** https://arxiv.org/abs/2411.07763
- **Benchmark Website / Leaderboard:** https://spider2-sql.github.io/
- **Data repo:** https://github.com/xlang-ai/Spider2

---

## 2. Overview

Spider 2.0 targets real, enterprise-scale text-to-SQL workflows rather than the compact, single-engine schemas of Spider 1.0 or BIRD. Its questions are grounded in real cloud data warehouses (BigQuery, Snowflake) as well as local SQLite databases, with schemas that can run to hundreds of columns and SQL-dialect differences (BigQuery's `TABLE_SUFFIX`/wildcard syntax, Snowflake functions, etc.) baked in as part of the challenge.

**Spider 2.0-Lite** is the "traditional text-in, text-out" subset used for standard NL2SQL evaluation. The full Spider 2.0-Lite has 547 examples across three backends: BigQuery (214), Snowflake (198), and local SQLite (135). Of these, only the 135 SQLite-backed examples are runnable without a BigQuery/Snowflake account, and only 256/547 (~47%) of all examples have their gold SQL publicly released — the rest are held out for the official leaderboard.

---

## 3. Dataset Scope: This Repository's Subset

This project uses a **deliberately narrower, fully execution-verified subset** of Spider 2.0-Lite's local-SQLite examples, rather than all 135. Every example included here satisfies **both** conditions:

1. The backing SQLite database is available and runs locally (no cloud credentials required).
2. The gold SQL answer is publicly released **and** was directly verified to execute successfully against the actual database during construction of this repository.

| Layer | Description |
|---|---|
| Full Spider 2.0-Lite | 547 examples across BigQuery, Snowflake, and local SQLite |
| Local-SQLite subset (official) | 135 examples runnable without cloud credentials |
| Local-SQLite subset with public gold SQL | 24 examples (of the 135) |
| **This repository** | **23 examples**, across **16 databases** — see exclusion note below |

**Why only 23, not 24 or 135:** Of the 135 locally-runnable examples, only 24 have a publicly released gold SQL file (the rest are held out for the official leaderboard and cannot be verified). Of those 24, one (`local003`, an E-commerce RFM-segmentation question) was found during construction of this repository to have a genuine **gold SQL / gold answer mismatch**: the released `local003.sql` computes an 11-row result under one segment taxonomy, while the released gold answer CSVs (`local003_a`–`_d`) show a *different* 9-row result under a different taxonomy entirely — the SQL text and the officially scored answer were not generated from the same query. Rather than include a known-incorrect gold answer, this example was excluded. The other 23 examples were individually executed against their real databases as part of building this repository and confirmed to run without error.

`nl_queries.json` entries here carry one extra field beyond the base schema, `source_instance_id`, which records the original Spider 2.0 instance ID (e.g. `local022`) for traceability back to the upstream release.

**This is intentionally not a representative sample of Spider 2.0's difficulty distribution.** The 111 local examples without public gold SQL, and the 412 BigQuery/Snowflake examples, are excluded entirely — this project only includes what can be independently verified end-to-end (question → SQL → real database → real answer), matching the same evaluation-readiness standard applied to `bird-dev/`.

---

## 4. Databases Included

16 of the 30 databases used across Spider 2.0-Lite's local-SQLite subset are included here (only those needed by the 23 curated questions). Many of these are well-known "learn SQL" tutorial schemas (Sakila, Pagila, Northwind-style, chinook) reused across many unrelated benchmarks, alongside real open datasets (Brazilian E-Commerce/Olist, IPL cricket, EU soccer, F1 racing, California traffic collisions).

| Database | Domain |
|---|---|
| `Baseball` | Sports statistics |
| `Brazilian_E_Commerce` | E-commerce (Olist marketplace) |
| `California_Traffic_Collision` | Transportation / public safety |
| `Db-IMDB` | Entertainment / movies |
| `EU_soccer` | Sports |
| `E_commerce` | E-commerce / retail |
| `EntertainmentAgency` | Entertainment booking |
| `IPL` | Sports (cricket) |
| `Pagila` | E-commerce / retail (DVD rental, Sakila-derived) |
| `WWE` | Entertainment |
| `bank_sales_trading` | Finance |
| `delivery_center` | Logistics |
| `education_business` | Education / mixed business data |
| `f1` | Sports (Formula 1) |
| `modern_data` | Miscellaneous |
| `sqlite-sakila` | Entertainment / retail (DVD rental) |

No official domain taxonomy exists for Spider 2.0 — unlike BIRD, which publishes a domain sunburst chart — so the labels above are this project's own descriptive grouping, not sourced from the benchmark itself.

---

## 5. Key Features

### 5.1 Enterprise-Scale, Real-World Schemas

Unlike Spider 1.0/BIRD's compact schemas, Spider 2.0's databases can span dozens of tables and hundreds of columns, closer to real production data warehouses.

### 5.2 Complex, Realistic SQL

Gold queries in this subset include multi-CTE window-function pipelines (e.g., RFM customer segmentation, moving averages via linear regression over date windows), not just single-table filters and joins.

### 5.3 No Human-Authored Column Descriptions

Unlike BIRD's `database_description/` CSVs, Spider 2.0 does not ship human-authored, per-column semantic descriptions. The `database_description/*.csv` files in this repository's databases are therefore populated with column names and declared SQL types only (via schema introspection) — the `column_description` and `value_description` fields are intentionally left blank rather than fabricated. This is itself a relevant contrast for ambiguity-aware NL2SQL research: this benchmark represents the harder, more realistic setting where no semantic layer is provided at all.

### 5.4 Known Data-Quality Caveat

As noted above, at least one gold SQL/gold-answer pair in the source release (`local003`) is internally inconsistent. This subset excludes it, but it is a useful reminder that "official" benchmark gold answers are not infallible — worth keeping in mind when using Spider 2.0-Lite more broadly, beyond this repository's curated subset.

---

## 6. Relevance to Ambiguity-Aware NL2SQL

| Ambiguity Layer | Description |
|---|---|
| Schema-scale ambiguity | With dozens of tables and hundreds of columns per database, correctly linking a phrase to the right table/column is substantially harder than in BIRD or Spider 1.0. |
| Missing semantic layer | With no `database_description`-style human annotations, models must resolve column meaning from naming and structure alone, or ask for clarification. |
| Query-complexity ambiguity | Gold queries often require choosing among several plausible multi-step computation strategies (e.g., which window function, which join path through a deep schema) to match the intended business logic. |
| Gold-answer reliability | The `local003` case shows that even the "ground truth" can be internally inconsistent, which is directly relevant to evaluating human-in-the-loop or self-verifying NL2SQL systems that must reconcile SQL output against an expected answer. |

---

## 7. Citation

```bibtex
@inproceedings{lei2024spider2,
  title = {Spider 2.0: Evaluating Language Models on Real-World Enterprise Text-to-SQL Workflows},
  author = {Lei, Fangyu and Chen, Jixuan and Ye, Yuxiao and others},
  booktitle = {International Conference on Learning Representations (ICLR)},
  year = {2025},
  url = {https://arxiv.org/abs/2411.07763}
}
```
