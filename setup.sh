#!/bin/bash


if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: source setup.sh\r\n"
    printf "\r\n"
    printf "Build and install the bam toolkit found at the source root directory specified in the file _srcroot or the default of `pwd`/Bam.Net.Core.\r\n"
    printf "\r\n"
    exit 0
fi

if [[ $_ != $0 ]]
    then        
        source ./build.sh
        echo ${DIST}
        source ./install.sh
else
    printf "Please source this file to ensure your PATH variable is properly updated.\r\n\r\n"
fi
