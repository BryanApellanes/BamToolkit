#!/bin/bash

source ./set-src-root.sh
source ./get-os-runtime.sh

./build-bake.sh

mkdir -p /tmp/bam/bin
OUTPUT=/tmp/bam/bin
printf "OUTPUT = $OUTPUT\r\n"
~/.bam/bake/bake /zip /zipRecipe:./recipes/$RUNTIME-bamtoolkit.json /output:${OUTPUT}

DIST=/tmp/bam
export DIST