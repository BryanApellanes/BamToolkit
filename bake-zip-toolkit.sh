#!/bin/bash

source ./set-src-root.sh
source ./get-os-runtime.sh

./build-bake.sh

OUTPUT=./build/bin
printf "OUTPUT = $OUTPUT\r\n"
~/.bam/bake/bake /zip /zipRecipe:./recipes/$RUNTIME-toolkit-recipe.json /output:$OUTPUT