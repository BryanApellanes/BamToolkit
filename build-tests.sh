#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build-tests.sh\r\n"
    printf "\r\n"
    printf "Builds all tests by calling ./tests/bake-discover-tests-recipe.sh then ./tests/bake-tests-recipe.sh.\r\n"
    printf "\r\n"
    exit 0
fi

cd ./tests
./bake-discover-tests-recipe.sh
./bake-tests-recipe.sh
cd ..