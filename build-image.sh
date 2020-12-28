#!/bin/bash
set -e
ulimit -Sn 10000
export NOREBO_ROOT=$PWD
rm -rf build

# ensure all Oberon source files have been converted to the correct format
# before we begin the build...

cd $1
for x in *.Mod *.Tool ; do ${NOREBO_ROOT}/bin/dos2oberon $x $x ; done
cd -

python3 bin/build-image.py $1

# Convert the files back to dos format for local editing...

cd $1
for x in *.Mod *.Tool ; do ${NOREBO_ROOT}/bin/oberon2dos $x $x ; done
cd -
