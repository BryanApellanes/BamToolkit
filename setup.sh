#!/bin/bash


if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: source setup.sh [install-links-to-directory]\r\n"
    printf "\r\n"
    printf "Build and install the bam toolkit found at the source root directory specified in the file _srcroot or the default of `pwd`/Bam.Net.Core.\r\n"
    printf "Optionally, specify a path to add sym links for each tool, presumably a directory included in the PATH so toolkit commands are available at\r\n"
    printf "the shell prompt.\r\n"
    printf "\r\n"
    exit 0
fi

if [[ !(-z $1) ]]; then
    BAMTOOLKITSYMLINKS=$1
fi

if [[ -z $BAMTOOLKITSYMLINKS ]]; then
    if [[ -z $1 ]]; then
        BAMTOOLKITSYMLINKS="/usr/local/bin"
    else
        BAMTOOLKITSYMLINKS=$1
    fi
fi

if [[ $_ != $0 ]]
    then        
        source ./build-toolkit.sh
        echo "distribution folder is ${DIST}"
        source ./install-toolkit.sh
        printf "installing symlinks to ${BAMTOOLKITSYMLINKS}"
        source ./symlink-toolkit.sh ${BAMTOOLKITSYMLINKS}
else
    printf "Please source this file to ensure your PATH variable is properly updated.\r\n\r\n"
    printf "example:\r\n\tsource ./$0\r\n\r\n"

fi
