#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build-images.sh\r\n"
    printf "\r\n"
    printf "Build the bamweb-runtime and bamweb-sdk docker images.\r\n"
    printf "\r\n"
    exit 0
fi

cd docker

./build.sh bamweb-runtime bamweb-runtime.Dockerfile
./build.sh bamweb-sdk bamweb-sdk.Dockerfile
./build.sh bamweb-runtime-aws bamweb-runtime.aws.Dockerfile
./build.sh bamweb-sdk-aws bamweb-sdk.aws.Dockerfile

./push.sh bamweb-runtime
./push.sh bamweb-sdk
./push.sh bamweb-runtime-aws
./push.sh bamweb-sdk-aws