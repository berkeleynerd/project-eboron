#!/bin/bash
set -e
ulimit -Sn 10000

ROOT="$PWD/risc-emulator"

cd $ROOT
echo $ROOT

make

echo 
echo '=== Copy risc binary to bin folder === '
cp $ROOT/risc ../bin

echo
echo '=== Removing build artifacts ==='
make clean
cd ..
