#!/bin/bash


if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: source setup-user.sh\r\n"
    printf "\r\n"
    printf "Build and install the bam toolkit found at the source root directory specified in the file _srcroot or the default of `pwd`/Bam.Net.Core.\r\n"
    printf "The same as 'setup.sh' with the exception that symlinks are placed in ~/.bam/toolkit instead of /usr/local/bin.\r\n"
    printf "\r\n"
    exit 0
fi

if [[ $_ != $0 ]]; then

    BAMTOOLKITSYMLINKS=~/.bam/toolkit
    source ./build-toolkit.sh
    echo "distribution folder is ${DIST}"
    source ./install-toolkit.sh
    printf "installing symlinks to ${BAMTOOLKITSYMLINKS}"
    source ./symlink-toolkit.sh ${BAMTOOLKITSYMLINKS}
else
    printf "Please source this file to ensure your PATH variable is properly updated.\r\n\r\n"
    printf "example:\r\n\tsource $0\r\n\r\n"
fi
