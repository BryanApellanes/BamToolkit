#!/bin/bash


if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: checkout.sh\r\n"
    printf "\r\n"
    printf "Checkout the latest 'bam-net-core' branch of the BamToolkit.\r\n"
    printf "\r\n"

    exit 0
fi

source ./set-src-root.sh 

echo ***** ${BAMNETVERSION}
echo getting ${BAMNETVERSION} branch of Bam.Net.Core repo
cd $SRCROOT
git fetch --all
git submodule update --init --recursive
git checkout -f ${BAMNETVERSION}
git pull --recurse-submodules
