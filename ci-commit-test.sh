#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: ci-commit-test.sh\r\n"
    printf "\r\n"
    printf "Creates the 'ci-test' branch from the current commit and force pushes it.\r\n"
    printf "\r\n"
    exit 0
fi

git branch -D ci-test
git checkout -b ci-test
git push -u origin ci-test -f