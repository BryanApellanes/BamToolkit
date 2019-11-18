#!/bin/bash

# The first argument should be the local filesystem path to the root of the Bam.Net git repository

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: bake-discover-recipe {{path to Bam.Net.Core}}\r\n"
    printf "\r\n"
    printf "Builds a temporary copy of bake.exe and uses it to discover tools in the specified Bam.Net.Core root.\r\n"
    printf "bake.exe looks for *.csproj files in the child directories of the _tools directory in the specified root.\r\n"
    printf "\r\n"

else

source ./set-src-root.sh
source ./get-os-runtime.sh

OUTPUTRECIPES=./recipes/

rm -fr ~/.bam/tmp/bake
dotnet publish $SRCROOT/_tools/bake/bake.csproj -c Release -r $RUNTIME -o ~/.bam/tmp/bake

~/.bam/tmp/bake/bake /discover:$SRCROOT/_tools/ /output:~/.bam/dist/bin /outputRecipe:$OUTPUTRECIPES$RUNTIME-bamtoolkit.json

fi