#!/bin/bash
set -e
cd "/Users/kaiyuli/Documents/Research/Agentic Query Processing/DA-Sim/src"
echo "=== spider2.0-lite ($(date)) ==="
python3 nl2sql_baseline.py ../datasets/spider2.0-lite results --workers 4
echo "=== science-benchmark ($(date)) ==="
python3 nl2sql_baseline.py ../datasets/science-benchmark results --workers 4
echo "=== bird-dev ($(date)) ==="
python3 nl2sql_baseline.py ../datasets/bird-dev results --workers 4
echo "=== ALL DONE ($(date)) ==="
