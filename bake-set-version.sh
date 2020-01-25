#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: bake-set-version.sh\r\n"
    printf "\r\n"
    printf "First builds the 'bake' utility found at the specified root directory.\r\n"
    printf "Then uses 'bake' to set the version for the projects specified in the recipe\r\n"
    printf "./recipes/$RUNTIME-bamtoolkit.json and ./recipes/$RUNTIME-bamfx-lib.json.\r\n"
    printf "\r\n"
    exit 0
fi

if [[ -z "$1" ]]; then
    VERSION=Patch
else
    VERSION=$1
fi

source ./set-src-root.sh
source ./get-os-runtime.sh

echo building bake from $BAMSRCROOT
./build-bake.sh $BAMSRCROOT

echo "setting version for `pwd`/recipes/$RUNTIME-bamfx-lib.json"
~/.bam/bake/bake /version:${VERSION} /versionRecipe:./recipes/$RUNTIME-bamfx-lib.json $2 $3 $4
~/.bam/bake/bake /version:${VERSION} /versionRecipe:./recipes/$RUNTIME-bamtoolkit.json $2 $3 $4