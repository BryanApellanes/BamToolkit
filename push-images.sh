#!/bin/bash

#!/bin/bash

if [[ $1 = "-help" ]] || [[ $1 = "-?" ]] || [[ $1 = "-h" ]]; then
    printf "usage: build-images.sh\r\n"
    printf "\r\n"
    printf "Build docker images for all the docker files found in the docker folder (./docker/*.Dockerfile).\r\n"
    printf "\r\n"
    exit 0
fi

cd docker

for DOCKERFILE in *.Dockerfile
do
  IMAGENAME="${DOCKERFILE%.*}"
  printf "Pushing ${IMAGENAME} => ./push.sh ${IMAGENAME}\r\n"
  ./push.sh ${IMAGENAME}
done

cd ..