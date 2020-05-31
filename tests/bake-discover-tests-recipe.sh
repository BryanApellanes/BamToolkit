#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: bake-discover-tests-recipe {{path to Bam.Net.Core}}\r\n"
    printf "\r\n"
    printf "Builds a temporary copy of 'bake' and uses it to discover tests in the specified Bam.Net.Core root.\r\n"
    printf "'bake' looks for *.csproj files in the child directories of the _tests/core directory in the specified root.\r\n"
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

~/.bam/tmp/bake/bake /discover:${BAMSRCROOT}/_tests/core/ /output:/tmp/bam/tests /outputRecipe:${OUTPUTRECIPES}${RUNTIME}-bamtoolkit-tests.json