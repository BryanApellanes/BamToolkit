#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]] || [[ $2 = "-help" ]] || [[ $2 = "-?" ]] || [[ $2 = "-h" ]]; then
    printf "usage: install-toolkit.sh [destination-directory]\r\n"
    printf "\r\n"
    printf "Using the zip file for the current os in the DIST folder ($DIST) or the default of (./dist) if the"
    printf "DIST environment variable is not set.\r\n"
    printf "Installs the BamToolkit to the specified directory; if no directory is specified the default\r\n"
    printf "~/.bam/toolkit/bin is used.\r\n"
    printf ""
    printf "\r\n"
    exit 0
fi

if [[ -z "$DIST" ]]; then
    DIST=/tmp/bam
fi

BAMTOOLKITBIN=$1

if [[ -d ${BAMTOOLKITBIN} ]]; then
    printf "\r\nThe specified output directory already exists, please move or delete the folder $BAMTOOLKITBIN.\r\n\r\n"
    exit 1
fi

if [[ -z "$1" ]]; then
    BAMTOOLKITBIN=~/.bam/toolkit/bin
    rm -fr ${BAMTOOLKITBIN}
fi

if [[ -z $BAMTOOLKITSYMLINKS ]]; then
    BAMTOOLKITSYMLINKS=~/.bam/toolkit
fi

source ./get-os-runtime.sh 

if [[ ! -f ${DIST}/${RUNTIME}-bamtoolkit.zip  ]]; then 
    printf "$DIST/$RUNTIME-bamtoolkit.zip not found, run build-toolkit.sh first.\r\n"
    exit 1
else
    mkdir -p ${BAMTOOLKITBIN}
    unzip $DIST/$RUNTIME-bamtoolkit.zip -d ${BAMTOOLKITBIN}
    source ./set-toolkit-path.sh ${BAMTOOLKITSYMLINKS}
fi

export BAMTOOLKITBIN
printf "Installed BamToolkit to ${BAMTOOLKITBIN}\r\n\r\n"
