#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]] || [[ $2 = "-help" ]] || [[ $2 = "-?" ]] || [[ $2 = "-h" ]]
then
    printf "usage: install.sh [destination-directory]\r\n"
    printf "\r\n"
    printf "Using the zip file for the current os in the DIST folder = ($DIST) or the default of (./dist) if the"
    printf "environment variable is not set.\r\n"
    printf "Installs the BamToolkit to the specified directory; if no directory is specified the default\r\n"
    printf "~/.bam/toolkit/bin is used.\r\n"
    printf ""
    printf "\r\n"
    exit 0
fi

if [[ -z "$DIST" ]]; then
    DIST=./dist
fi

DESTINATION=$1

if [[ -d $DESTINATION ]]
    then
        printf "\r\nThe specified output directory already exists, please move or delete the folder $DESTINATION.\r\n\r\n"
        exit 1
fi

if [[ -z "$1" ]]
    then
        DESTINATION=~/.bam/toolkit/bin
        rm -fr $DESTINATION
fi

source ./get-os-runtime.sh 

if [[ ! -f $DIST/$RUNTIME-bamtoolkit.zip  ]]
    then 
        printf "$DIST/$RUNTIME-bamtoolkit.zip not found, run build.sh first.\r\n"
        exit 1
else
    mkdir -p $DESTINATION
    unzip $DIST/$RUNTIME-bamtoolkit.zip -d $DESTINATION
    source ./set-toolkit-path.sh $DESTINATION
fi

chmod 755 $DESTINATION/*

printf "Installed the BamToolkit to $DESTINATION\r\n\r\n"