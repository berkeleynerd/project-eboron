#!/bin/bash
set -e
ulimit -Sn 10000
cd $1
for x in *.Mod *.Tool ; do ../src/utils/dos2oberon $x $x ; done
cd -