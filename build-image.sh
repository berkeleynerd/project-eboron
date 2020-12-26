#!/bin/bash
set -e
ulimit -Sn 10000
rm -rf build
python3 src/utils/build-image.py $1
