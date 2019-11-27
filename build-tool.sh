#!/bin/bash

if [[ -z "$1" ]] || [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]
then
    printf "usage: build.sh\r\n"
    printf "\r\n"
    printf "Build the bam tool found at the root source directory specified in the file _srcroot or the default of `pwd`/Bam.Net.Core.\r\n"
    printf "\r\n"
    exit 0
else

source ./set-src-root.sh
source ./get-os-runtime.sh 

./checkout.sh

PROJECTNAME=$1

echo Runtime is set to $RUNTIME

echo publishing $PROJECTNAME to ~/.bam/toolkit/$RUNTIME/$PROJECTNAME working directory is `pwd`
mkdir -p ~/.bam/toolkit/$RUNTIME/$PROJECTNAME
dotnet publish ./Bam.Net.Core/_tools/$PROJECTNAME/$PROJECTNAME.csproj -c Release -r $RUNTIME -o ~/.bam/toolkit/$RUNTIME/$PROJECTNAME

fi