#!/bin/bash
# The first argument should be the local filesystem path to the root of the Bam.Net git repository

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: bake-recipe.sh\r\n"
    printf "\r\n"
    printf "First builds the 'bake' utility found at the specified root directory.\r\n"
    printf "Then uses 'bake' to build tests for the bam toolkit as specified in the recipe\r\n"
    printf "../recipes/$RUNTIME-bamtoolkit-tests.json.\r\n"
    printf "\r\n"
    exit 0
fi

cd ..
source ./get-os-runtime.sh
cd tests

BAMSRCROOT=../Bam.Net.Core
OUTPUTRECIPES=../recipes/

rm -fr ~/.bam/tmp/bake
echo "building => dotnet publish ${BAMSRCROOT}/_tools/bake/bake.csproj -c Release -r ${RUNTIME} -o ~/.bam/tmp/bake"
dotnet publish ${BAMSRCROOT}/_tools/bake/bake.csproj -c Release -r ${RUNTIME} -o ~/.bam/tmp/bake

echo baking `pwd`/../recipes/${RUNTIME}-bamtoolkit-tests.json
~/.bam/bake/bake /recipe:../recipes/${RUNTIME}-bamtoolkit-tests.json