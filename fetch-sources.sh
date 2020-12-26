#!/bin/bash
set -e
ulimit -Sn 10000
python3 src/utils/fetch-sources.py $1
