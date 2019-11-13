#!/bin/bash

if [[ -f "_srcroot" ]]
then
    SRCROOT=$(<_srcroot)
else
    SRCROOT=`pwd`/Bam.Net.Core
fi



export SRCROOT

echo 'SRCROOT is set to' $SRCROOT