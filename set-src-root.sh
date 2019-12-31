#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: set-src-root.sh [path_to_bam_net_core_src]\r\n"
    printf "\r\n"
    printf "Sets and exports the variable SRCROOT if it is not already set.  If the file ./_srcroot\r\n"
    printf "exists, SRCROOT is set to the value found there."
    printf "\r\n"
    exit 0
fi

if [[ !(-z $1) ]]; then
    printf "Specified SRCROOT $1"
    if [[ !(-d $1) ]]; then
        printf "The specified directory doesn't exist: $1\r\n"
        exit 1
    else
        SRCROOT=$1
    fi
fi

if [[ -z $SRCROOT ]]; then
    if [[ -f "_srcroot" ]]; then
        SRCROOT=$(<_srcroot)
    else
        SRCROOT=`pwd`/Bam.Net.Core
    fi
fi

export SRCROOT

echo 'SRCROOT is set to' $SRCROOT