#!/bin/bash


if [[ -z "$1" ]] || [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: docker-run.sh <image-name> <innerport>:<outerport>\r\n"
    printf "\r\n"
    printf "Using docker, starts a bash prompt in the specified container to explore and debug its content.\r\n"
    printf "\r\n"
    exit 0
else

PORTS=8080:80

if [[ -z "$2" ]]
    then
        PORTS=$2
fi

SUFFIX=`date | md5`

IMAGE=$1

docker run -d -p $PORTS --name $IMAGE-$SUFFIX $IMAGE

fi