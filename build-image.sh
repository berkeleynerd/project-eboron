#!/bin/bash
set -e
ulimit -Sn 10000
export NOREBO_ROOT=$PWD
rm -rf build
python3 bin/build-image.py $1
