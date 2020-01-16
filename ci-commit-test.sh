#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: ci-commit-test.sh\r\n"
    printf "\r\n"
    printf "Creates the 'ci-test' branch from the current commit and force pushes it.\r\n"
    printf "\r\n"
    exit 0
fi

printf "SSH_PUBLIC_KEY = ${SSH_PUBLIC_KEY}"

git push "git@github.com:BryanApellanes/BamToolkit.git" HEAD:ci-test -f