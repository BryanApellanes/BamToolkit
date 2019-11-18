#!/bin/bash

source ./set-src-root.sh
source ./get-os-runtime.sh

./build-bake.sh

OUTPUT=~/.bam/dist/bin
printf "OUTPUT = $OUTPUT\r\n"
~/.bam/bake/bake /zip /zipRecipe:./recipes/$RUNTIME-bamtoolkit.json /output:$OUTPUT