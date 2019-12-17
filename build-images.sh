#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build-images.sh\r\n"
    printf "\r\n"
    printf "Build the bamweb-runtime and bamweb-sdk docker images.\r\n"
    printf "\r\n"
    exit 0
fi

cd docker

./docker-build.sh bamweb-runtime bamweb-runtime.Dockerfile
./docker-build.sh bamweb-sdk bamweb-sdk.Dockerfile
./docker-build.sh bamweb-runtime-aws bamweb-runtime.aws.Dockerfile
./docker-build.sh bamweb-sdk-aws bamweb-sdk.aws.Dockerfile

./docker-push.sh bamweb-runtime
./docker-push.sh bamweb-sdk
./docker-push.sh bamweb-runtime-aws
./docker-push.sh bamweb-sdk-aws