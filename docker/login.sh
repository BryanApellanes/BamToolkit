#!/bin/bash

printf "IMAGEREGISTRY is ${IMAGEREGISTRY}\r\n"
cd login
./dockerhub.sh
cd ..