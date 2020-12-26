#!/bin/bash
set -e
ulimit -Sn 10000
python3 build-image.py $1
