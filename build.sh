#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build.sh\r\n"
    printf "\r\n"
    printf "Build the bam toolkit found at the root source directory specified in the file _srcroot or the default of `pwd`/Bam.Net.Core.\r\n"
    printf "\r\n"
    exit 0
fi

source ./set-src-root.sh
source ./get-os-runtime.sh 

./checkout.sh

./bake-discover-recipe.sh
./bake-recipe.sh 
source ./bake-zip-toolkit.sh

echo from build ${DIST}
export DIST