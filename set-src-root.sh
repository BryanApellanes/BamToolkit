#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: set-src-root.sh [path_to_bam_net_core_src]\r\n"
    printf "\r\n"
    printf "Sets and exports the variable SRCROOT if it is not already set.  If the file ./_srcroot\r\n"
    printf "exists, SRCROOT is set to the value found there."
    printf "\r\n"
    exit 0
fi

if [[ -z $SRCROOT ]]; then
    if [[ -f "_srcroot" ]]; then
        printf "reading _srcroot file\r\n"
        SRCROOT=$(<_srcroot)
    else
        SRCROOT=`pwd`/Bam.Net.Core
    fi
fi

export SRCROOT

echo 'SRCROOT is set to' $SRCROOT