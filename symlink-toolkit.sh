#!/bin/bash

if [[ -z $1 ]] || [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: symlink-toolkit.sh <from> <to>\r\n"
    printf "\r\n"
    printf "Add symlinks in the specified 'from' directory for the bam toolkit installed at the specified 'to' directory.\r\n"
    printf "The 'to' parameter is optional if the environment variable BAMTOOLKITBIN is set.\r\n"
    printf "\r\n"

    exit 0
fi

if [[ -z $BAMTOOLKITSYMLINKS ]]; then
    BAMTOOLKITSYMLINKS=$1 # where to put symlinks
fi

if [[ -z $BAMTOOLKITBIN ]]; then
    BAMTOOLKITBIN=$2
fi

if [[ -z $BAMTOOLKITBIN ]]; then
    printf "\r\n"
    printf "Please set the environment variable BAMTOOLKITBIN or specify the toolkit bin path as the second parameter to this script.\r\n"
    printf "\r\n"
    exit 1
fi

printf "BAMTOOKITSYMLINKS will go ${BAMTOOLKITSYMLINKS}\r\n"
curdir=`pwd`
cd ${BAMTOOLKITBIN}
for TOOLNAME in $(ls -d */ | sed 's#/##')
do
    printf "Setting permission mode to 755 for ${BAMTOOLKITBIN}/${TOOLNAME}/${TOOLNAME}\r\n"
    chmod 755 ${BAMTOOLKITBIN}/${TOOLNAME}/${TOOLNAME}
    printf "Adding symlink ${BAMTOOLKITSYMLINKS}/${TOOLNAME} => ${BAMTOOLKITBIN}/${TOOLNAME}\r\n"  
    if [[ -L ${BAMTOOLKITSYMLINKS}/${TOOLNAME} ]]; then
        printf "Removing existing link ${BAMTOOLKITSYMLINKS}/${TOOLNAME}"
        rm ${BAMTOOLKITSYMLINKS}/${TOOLNAME}
    fi
    ln -s ${BAMTOOLKITBIN}/${TOOLNAME}/${TOOLNAME} ${BAMTOOLKITSYMLINKS}/${TOOLNAME}    
    printf "\r\n"
done
cd $curdir

export BAMTOOLKITSYMLINKS
printf "\r\n"
printf "BamToolkit sym links added to ${BAMTOOLKITSYMLINKS}\r\n\r\n"