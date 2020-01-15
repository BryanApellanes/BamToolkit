#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: ci-commit-test.sh\r\n"
    printf "\r\n"
    printf "Creates the 'ci-test' branch from the current commit and force pushes it.\r\n"
    printf "\r\n"
    exit 0
fi

if [[ -z SSH_PRIVATE_KEY ]]; then
    printf "SSH_PRIVATE_KEY environment variable not set.\r\n"
    exit 1;
fi

if [[ -z SSH_PUBLIC_KEY ]]; then 
    printf "SSH_PUBLIC_KEY environment variable not set.\r\n"
    exit 1;
fi

mkdir -p ~/.ssh
echo $SSH_PRIVATE_KEY > ~/.ssh/id_rsa
echo $SSH_PUBLIC_KEY > ~/.ssh/id_rsa.pub

git branch -D ci-test
git checkout -b ci-test
git push -u origin ci-test -f