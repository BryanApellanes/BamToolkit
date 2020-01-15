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

printf "GITHUB_TOKEN = ${GITHUB_TOKEN}"

mkdir -p ~/.ssh
echo $SSH_PRIVATE_KEY > ~/.ssh/id_rsa
echo $SSH_PUBLIC_KEY > ~/.ssh/id_rsa.pub

chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa

git push "git@github.com:BryanApellanes/BamToolkit.git" HEAD:ci-test -f