#!/bin/bash

cd docker

./docker-build.sh bamweb-runtime bamweb-runtime.Dockerfile
./docker-build.sh bamweb-sdk bamweb-sdk.Dockerfile

./docker-push.sh bamweb-runtime
./docker-push.sh bamweb-sdk