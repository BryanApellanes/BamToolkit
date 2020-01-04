#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build.sh <version>\r\n"
    printf "\r\n"
    printf "Build the bam toolkit found at the root source directory specified in the file _srcroot or the default of `pwd`/Bam.Net.Core.\r\n"
    printf "\r\n"
    printf "The <version> may be the name of a branch or a commit hash; <version> should not be confused with the semver version\r\n"
    printf "that may be assigned at release."
    printf "\r\n"

    exit 0
fi

if [ -z "$1" ]; then 
  BAMNETVERSION=bam-net-core
else
  BAMNETVERSION=$1
fi

source ./set-src-root.sh
source ./get-os-runtime.sh 

./checkout.sh

./bake-discover-lib-recipe.sh
./bake-lib-recipe.sh 
./bake-pack-nuget-lib.sh