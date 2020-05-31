#!/bin/bash


if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: checkout.sh\r\n"
    printf "\r\n"
    printf "Checkout the latest 'bam-net-core' branch of the BamToolkit.\r\n"
    printf "\r\n"

    exit 0
fi

if [ -z "$1" ]; then 
  BAMNETBRANCH=bam-net-core
else
  BAMNETBRANCH=$1
fi

source ./set-src-root.sh 

echo ***** ${BAMNETBRANCH}
echo getting ${BAMNETBRANCH} branch of Bam.Net.Core repo
cd $BAMSRCROOT
git fetch --all
git checkout -f ${BAMNETBRANCH}
git submodule update --init --recursive
