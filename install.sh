#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]] || [[ $2 = "-help" ]] || [[ $2 = "-?" ]] || [[ $2 = "-h" ]]
then
    printf "usage: install.sh\r\n"
    printf "\r\n"
    printf "Installs the BamToolkit to the specified directory, if no directory is specified the default\r\n"
    printf "~/.bam/toolkit/bin is used."
    printf "\r\n"

else

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

if [[ ! -f ./dist/$RUNTIME-bamtoolkit.zip  ]]
    then 
        printf "$RUNTIME-bamtoolkit.zip not found, run build.sh first.\r\n"
        exit 1
else
    mkdir -p $DESTINATION
    unzip ./dist/$RUNTIME-bamtoolkit.zip -d $DESTINATION
fi

chmod 755 $DESTINATION/*

source ./set-toolkit-path.sh $DESTINATION

export PATH

printf "Installed the BamToolkit to $DESTINATION\r\n\r\n"
# //closer for help
fi