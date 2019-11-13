#!/bin/bash

echo ***** $BAMNETVERSION
echo getting $BAMNETVERSION branch of Bam.Net.Core repo
cd Bam.Net.Core 
git fetch --all
git checkout -f $BAMNETVERSION
git pull --recurse-submodules
git submodule update --init --recursive
