# A Human-in-the-Loop Benchmark for NL2SQL

## Version Control

- **Date:** 2026-08-25
- **Version:** 0.1
- **Author:** Kaiyu Li
- **Update Type:** Manual

---

## Paper

- **Title:** TBD
- **Authors:** TBD.
- **Venue:** TBD
- **arXiv:** TBD
- **Benchmark Website:** TBD
- **Leaderboard:** TBD

---

## Overview

This repository provides a benchmark suite for evaluating human-in-the-loop NL2SQL tasks. NL2SQL refers to the task of translating natural language questions into executable SQL queries.

The benchmark is designed to represent different structural layers involved in practical data-agent scenarios, including the database layer, schema layer, semantic-description layer, natural-language query layer, gold-SQL layer, and reference-document layer.

The benchmark suite currently includes three benchmark folders:

- `bird-dev/`
- `science-benchmark/`
- `spider2.0-lite/`

At this stage, only the `bird-dev/` benchmark has been completed. The construction of `science-benchmark/` and `spider2.0-lite/` is planned as future work.

---

## Project Structure

Each benchmark folder contains the following assets.

### `databases/`

The `databases/` directory contains all databases or data lakes used to evaluate NL2SQL tasks. Each database or data lake is stored in a separate subfolder. Each subfolder corresponds to a practical data-agent scenario and describes the per-database structure, including the executable SQLite database and its semantic descriptions.

Each database folder may contain the following files or subdirectories.

#### `<db_name>.sqlite`

The actual executable database. This is the database against which both gold SQL queries and generated SQL queries are executed. It is the core artifact required to compute Execution Accuracy (EX).

> **Note:** The `.sqlite` database files are not tracked in this GitHub repository (they are excluded via `.gitignore`), since several of them exceed GitHub's file-size limits. For `bird-dev/`, the original `.sqlite` files can be downloaded from the official BIRD benchmark website: https://bird-bench.github.io/. After downloading, place each `<db_name>.sqlite` file into its corresponding `databases/<db_name>/` folder to reconstruct the full benchmark locally.

#### `database_description/`

The `database_description/` directory contains one CSV file per table. Each CSV file describes the semantic meaning of columns and values in the corresponding table.

Each CSV file follows the structure below:

```text
original_column_name, column_name, column_description, data_format, value_description
```

This directory provides the human-readable semantic layer that is not fully captured by the `.sqlite` file or `tables.json`. In particular, it explains what a column means and how its values should be interpreted.

For example:

```text
SEX → "F: female; M: male"
```

The `.sqlite` file alone may indicate that a column exists, but it does not necessarily explain what the column represents. Therefore, `database_description/` is needed to help models or human annotators resolve database-value ambiguity.

In practice, the coverage of `column_description` and `value_description` may be uneven. Some cells may be blank, while others may simply repeat the column name.

---

### `description.md`

The `description.md` file describes the structure of the benchmark, including its databases, schemas, tasks, and queries.

---

### `gold.sql`

The `gold.sql` file contains the ground-truth SQL queries for the NL2SQL tasks. These SQL queries are used as reference answers for evaluation.

---

### `human_knows.json`

The `human_knows.json` file provides span-level ambiguity annotations for the natural-language questions in `nl_queries.json`. It is designed to simulate a human-in-the-loop NL2SQL system: when an NL2SQL agent detects that a phrase in the question is ambiguous or under-specified, it can pose a clarification question, and `human_knows.json` acts as the oracle that supplies the answer a human user would give.

It is represented as a single JSON list, where each object corresponds one-to-one with an entry in `nl_queries.json`.

| Field | Type | Description |
|---|---|---|
| `question_id` | `int` | Matches the `question_id` in `nl_queries.json`. |
| `db_id` | `string` | The database name, matching the corresponding entry in `nl_queries.json`. |
| `evidence` | `list[object]` | A list of annotated spans within the question. May be empty if a question has no annotated spans. |

Each object in `evidence` has the following structure:

| Field | Type | Description |
|---|---|---|
| `type` | `string` | The ambiguity category of the span, drawn from the taxonomy in `bird-dev/nl2sql_ambiguity_taxonomy.md` (e.g., `noun`, `adjective`, `comparative_superlative`, `value_grounding`, `threshold`, `relation_join`, `temporal`, `operator`, `aggregation`, `domain_predicate`). |
| `phrase` | `string` | The exact span from the question text that is ambiguous, under-specified, or otherwise requires grounding. |
| `resolution` | `string` | The clarification a human user would give if asked "what do you mean by `phrase`?" — phrased as a natural-language answer, not as SQL. |

For example, for the question *"please tell me the top-5 greatest universities in Canada"*, an entry might be:

```json
{
  "type": "adjective",
  "phrase": "greatest",
  "resolution": "highest QS rank"
}
```

A human-in-the-loop simulation can look up the matching `phrase` in `human_knows.json` to answer a clarification question raised by the NL2SQL agent, without requiring an actual human in the loop during evaluation.

Unlike `database_description/`, which documents column- and value-level semantics of the database itself, `human_knows.json` documents ambiguity in the natural-language question. Coverage spans the full range from genuine ambiguity (e.g., a vague superlative with no defined metric) to simple schema-pointer clarifications (e.g., a phrase that maps directly to a specific column) — every question in `nl_queries.json` has at least one annotated entry, even where the question is largely unambiguous.

At this stage, `human_knows.json` is only available for `bird-dev/`.

---

### `nl_queries.json`

The `nl_queries.json` file contains the natural-language questions for the NL2SQL tasks. Each entry corresponds to one task and is ordered to align one-to-one with the SQL queries in `gold.sql`.

---

### `references/`

The `references/` directory contains papers relevant to the benchmark. These may include the paper in which the benchmark was originally published, as well as representative papers that use or discuss the benchmark. The reference papers are stored in PDF format.

---

### `tables.json`

The `tables.json` file provides the machine-readable schema for all databases or data lakes under `databases/`. It is represented as a single JSON list, where each object corresponds to one database.

| Field | Type | Description |
|---|---|---|
| `db_id` | `string` | The database name, e.g., `"debit_card_specializing"`. |
| `table_names_original` | `list[str]` | Raw table names exactly as they appear in the SQL schema, e.g., `["customers", "gasstations", "products", "transactions_1k", "yearmonth"]`. |
| `table_names` | `list[str]` | Human-readable versions of the table names, usually lowercased with underscores replaced by spaces. |
| `column_names_original` | `list[[int, str]]` | A flat list of all columns across all tables in the database. Each column is paired with the index of its parent table in `table_names_original`. For example, `[0, "CustomerID"]` refers to the `CustomerID` column in the `customers` table. The first entry is usually `[-1, "*"]`, which represents the `SELECT *` placeholder rather than a real column. |
| `column_names` | `list[[int, str]]` | The same structure as `column_names_original`, but with human-readable column names. |
| `column_types` | `list[str]` | A list of column types parallel to the column lists, such as `text`, `integer`, `real`, or `date`. |
| `primary_keys` | `list[int \| list[int]]` | Indices into `column_names_original` that indicate primary-key columns. A single integer represents a single-column primary key, while a nested list, such as `[19, 20]`, represents a composite primary key. |
| `foreign_keys` | `list[[int, int]]` | Pairs of column indices in the form `[from_column_index, to_column_index]`. These indicate declared foreign-key relationships in the underlying SQLite schema. |

#### Key Mechanics of `tables.json`

1. **Column indices are global within each database.**

   The `column_names_original` field is a flat list spanning all tables in a database. Therefore, `primary_keys` and `foreign_keys` refer to positions in this global column list, not to column positions within individual tables.

2. **Foreign keys are extracted from declared schema constraints.**

   The `foreign_keys` field records relationships that are explicitly declared through `REFERENCES` or `FOREIGN KEY` clauses in the underlying SQLite schema. It should not be treated as a complete inferred join graph.

   For example, in the `debit_card_specializing` database from `bird-dev`, the raw `CREATE TABLE` DDL declares only the following relationship:

   ```text
   yearmonth.CustomerID → customers.CustomerID
   ```

   This corresponds to:

   ```json
   "foreign_keys": [[19, 1]]
   ```

   However, the gold SQL queries in the dev set may also join `transactions_1k` with `customers`, `gasstations`, and `products` through `CustomerID`, `GasStationID`, and `ProductID`. These are real and usable join paths, but they may not be declared as explicit foreign-key constraints. Therefore, `tables.json` alone may under-report the complete practical join graph.

3. **`tables.json` captures structural information only.**

   It does not provide column meanings, value semantics, formulas, or domain-specific explanations. This semantic gap is filled by the files under `database_description/`.

   For example, `database_description/*.csv` may explain that:

   ```text
   SEX → "F: female; M: male"
   ```

   It may also provide formula-level information, such as:

   ```text
   total price = Amount × Price
   ```

   Such information is necessary for resolving value ambiguity and answering certain numeric-computation questions. These semantics cannot be fully represented by schema-structure fields alone. However, such information are not included in tables.json, which focus on databases' structures. 

