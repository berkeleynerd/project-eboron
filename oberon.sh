#!/bin/bash

./build-image.sh src/Oberon

bin/risc build/Oberon.dsk
