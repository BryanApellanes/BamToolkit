#!/bin/bash


if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: checkout.sh <version>\r\n"
    printf "\r\n"
    printf "Checkout the specified <version> of the BamToolkit.  If no <version> is specified, the value 'bam-net-core' is used.\r\n"
    printf "\r\n"
    printf "The <version> may be the name of a branch or a commit hash; <version> should not be confused with the semver version\r\n"
    printf "that may be assigned at release."
    printf "\r\n"

    exit 0
fi

if [ -z "$1" ]; then 
  BAMNETVERSION=bam-net-core
else
  BAMNETVERSION=$1
fi

source ./set-src-root.sh

echo ***** $BAMNETVERSION
echo getting $BAMNETVERSION branch of Bam.Net.Core repo
cd $SRCROOT
git fetch --all
git submodule update --init --recursive
git checkout -f $BAMNETVERSION
git pull --recurse-submodules
