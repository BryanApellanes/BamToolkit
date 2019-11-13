#!/bin/bash
# The first argument should be the local filesystem path to the root of the Bam.Net git repository

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: bake-recipe.sh [bamNetRootDirectory]\r\n"
    printf "\r\n"
    printf "First builds the 'bake' utility found at the specified root directory.\r\n"
    printf "Then uses 'bake' to build the bam toolkit as specified in the recipe\r\n"
    printf "./recipes/$RUNTIME-toolkit-recipe.json.\r\n"
    printf "\r\n"

else

source ./set-src-root.sh
source ./get-os-runtime.sh

echo building bake from $SRCROOT
./build-bake.sh $SRCROOT

echo baking `pwd`/recipes/$RUNTIME-toolkit-recipe.json
~/.bam/bake/bake /recipe:./recipes/$RUNTIME-toolkit.json

fi