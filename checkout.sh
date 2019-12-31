#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: checkout.sh [branch = 'bam-net-core' | commit | tag]\r\n"
    printf "\r\n"
    printf "Checkout the latest version of the specified branch, commit or tag.  The default is\r\n"
    printf "'bam-net-core' if no value is specified."
    printf "\r\n"
    exit 0
fi

if [[ -z "$1" ]]; then 
  BAMNETVERSION=bam-net-core
fi

source ./set-src-root.sh

echo ***** ${BAMNETVERSION}
echo getting ${BAMNETVERSION} branch of Bam.Net.Core repo
cd $SRCROOT
git fetch --all
git submodule update --init --recursive
git checkout -f ${BAMNETVERSION}
git pull --recurse-submodules
