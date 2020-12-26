#!/bin/bash
set -e
ulimit -Sn 10000
python3 src/utils/build-image.py $1
