# BIRD: A Big Benchmark for Large-Scale Database-Grounded Text-to-SQL

## 1. Paper Information

- **Title:** Can LLM Already Serve as A Database Interface? A BIg Bench for Large-Scale Database Grounded Text-to-SQLs
- **Authors:** Jinyang Li, Binyuan Hui, Ge Qu, Jiaxi Yang, Binhua Li, Bowen Li, Bailin Wang, Bowen Qin, Rongyu Cao, Ruiying Geng, Nan Huo, Xuanhe Zhou, Chenhao Ma, Guoliang Li, Kevin C. C. Chang, Fei Huang, Reynold Cheng, and Yongbin Li
- **Venue:** NeurIPS 2023 Datasets and Benchmarks Track
- **arXiv:** https://arxiv.org/abs/2305.03111
- **Benchmark Website:** https://bird-bench.github.io/
- **Leaderboard:** https://bird-bench.github.io/

---

## 2. Overview

BIRD, short for **BIg Bench for LaRge-scale Database Grounded Text-to-SQL Evaluation**, is a large-scale benchmark for evaluating text-to-SQL systems under realistic database-grounded settings.

The benchmark was proposed to address limitations in earlier text-to-SQL datasets, where models could often rely mainly on schema understanding. In contrast, BIRD emphasizes real-world database values, external knowledge, noisy database contents, and SQL execution efficiency. These properties make BIRD especially relevant for evaluating whether large language models can serve as reliable natural-language interfaces to databases.

The full BIRD benchmark contains:

- **12,751** natural-language question and SQL pairs
- **95** large databases
- **33.4 GB** of database content
- **37+** professional domains

This repository focuses on the **BIRD development split** (`bird-dev`), which contains:

- **1,534** evaluation tasks
- **11** databases
- Approximately **1.5 GB** of database content

---

## 3. Dataset Scope

This project uses only the development split of the original BIRD benchmark. The goal is to provide a focused evaluation setting for testing NL2SQL or text-to-SQL algorithms without requiring the training process for fine-tuning the NL2SQL models.

| Layer | Description |
|---|---|
| Full Benchmark | The complete BIRD benchmark with 12,751 question-SQL pairs and 95 databases |
| Development Split | The BIRD dev set with 1,534 tasks across 11 databases |
| This Repository | A dev-only benchmark setup for evaluating NL2SQL algorithms |

---

## 4. Dataset Statistics

| Property | Value |
|---|---|
| Total NL-SQL pairs | 1,534 |
| Databases | 11 |
| Database content size | Approximately 1.5 GB |
| Evidence annotations | Yes |
| Task type | Database-grounded text-to-SQL |
| Evaluation focus | Execution accuracy and database-value understanding |

---

## 5. Key Features

### 5.1 Real-World Database Content

BIRD uses real-world databases with actual data values. This makes the benchmark more realistic than settings where models only need to understand table and column names.

### 5.2 Database Value Ambiguity

Many questions require models to inspect or reason over actual database values. Correct SQL generation may depend not only on schema linking, but also on understanding the meaning, format, and distribution of values stored in the database.

### 5.3 External Knowledge Evidence

BIRD provides evidence annotations that capture external or domain-specific knowledge needed to interpret some questions. For example, a question may require understanding a domain-specific phrase before it can be translated into SQL.

### 5.4 Dirty and Noisy Data

The databases may contain real-world data issues such as missing values, inconsistent formatting, abbreviations, and domain-specific conventions.

### 5.5 Noisy or Domain-Specific Schema Names

Table and column names may be abbreviated, cryptic, or highly domain-specific. This increases the difficulty of schema linking and semantic interpretation.

---

## 6. Relevance to Ambiguity-Aware NL2SQL

BIRD is particularly useful for studying ambiguity in NL2SQL because it contains several layers of uncertainty:

| Ambiguity Layer | Description |
|---|---|
| Schema-level ambiguity | The model must map natural-language expressions to the correct tables and columns. |
| Value-level ambiguity | The model must understand actual database values, not just schema names. |
| Domain-knowledge ambiguity | Some questions require external knowledge or evidence to interpret correctly. |
| Query-intent ambiguity | The same natural-language phrase may imply different SQL operations depending on the database context. |
| Execution-level ambiguity | A syntactically valid SQL query may still produce an incorrect result if it captures the wrong intent. |

These structural layers make BIRD a suitable benchmark for evaluating evidence-based, ambiguity-aware, and database-grounded NL2SQL frameworks.

---

## 7. Reference Results

The original BIRD paper reported a large gap between model performance and human performance. In the paper, ChatGPT achieved **40.08% execution accuracy**, while human performance reached **92.96%**. This gap shows that realistic, database-grounded text-to-SQL remains challenging.

Because the official BIRD leaderboard is continuously updated, current state-of-the-art results should be checked directly from the official benchmark website before reporting them in a paper or README.

---

## 8. Citation

```bibtex
@inproceedings{li2023bird,
  title = {Can LLM Already Serve as A Database Interface? A BIg Bench for Large-Scale Database Grounded Text-to-SQLs},
  author = {Li, Jinyang and Hui, Binyuan and Qu, Ge and Yang, Jiaxi and Li, Binhua and Li, Bowen and Wang, Bailin and Qin, Bowen and Cao, Rongyu and Geng, Ruiying and Huo, Nan and Zhou, Xuanhe and Ma, Chenhao and Li, Guoliang and Chang, Kevin C. C. and Huang, Fei and Cheng, Reynold and Li, Yongbin},
  booktitle = {Advances in Neural Information Processing Systems},
  year = {2023},
  url = {https://arxiv.org/abs/2305.03111}
}
```
