#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: set-toolkit-path.sh [BamToolkitDirectory]\r\n"
    printf "\r\n"
    printf "Add the specified directory (or the default if no directory is specified) to the environment path variable.\r\n"
    printf "The default BamToolkitDirectory is '~/.bam/toolkit/bin'.\r\n"
    printf "One should execute 'source set-toolkit-path.sh [BamToolkitDirectory]' to add the path to the current environment.\r\n"
    printf "\r\n"
    exit 0
fi

if [[ ! -z "$1" ]]
    then
        printf "adding ${1} to the PATH\r\n\r\n"
        [[ ":$PATH:" != *":${1}:"* ]] && export PATH="${1}:${PATH}"
else

    printf "updating the PATH\r\n\r\n"
    HOME=~

    [[ ":$PATH:" != *":${HOME}/.bam/toolkit:"* ]] && export PATH="${HOME}/.bam/toolkit:${PATH}"

    printf "PATH = ${PATH}\r\n\r\n"
fi