#!/bin/bash

if [[ -z "$1" ]] || [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build.sh <image-tag> [Dockerfile]\r\n"
    printf "\r\n"
    printf "Creates an image using the specified tag/name and specified dockerfile.\r\n"
    printf "If no docker file is specified 'Dockerfile' is used.\r\n"
    printf "\r\n"
    exit 0
fi

TAG=$1
FILE=Dockerfile

if [[ $# -eq 2 ]]; then
    FILE=$2
fi

docker build -t $TAG . -f $FILE
