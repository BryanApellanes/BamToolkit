#!/bin/bash

if [ -z "$1" ]
then 
  BAMNETVERSION=bam-net-core
fi

source ./set-src-root.sh

echo ***** $BAMNETVERSION
echo getting $BAMNETVERSION branch of Bam.Net.Core repo
cd $SRCROOT
git fetch --all
git submodule update --init --recursive
git checkout -f $BAMNETVERSION
git pull --recurse-submodules
