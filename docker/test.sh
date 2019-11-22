#!/bin/bash

if [[ $# -eq 2 ]]; then
    if [[ $1 = "container" ]]; then
        COMMAND=exec
        CONTAINER_ID=$2
    fi
    if [[ $2 = "container" ]]; then
        COMMAND=exec
        CONTAINER_ID=$1
    fi
    if [[ $1 = "image" ]]; then
        COMMAND=run
        CONTAINER_ID=$2
    fi
    if [[ $2 = "image" ]]; then
        COMMAND=run
        CONTAINER_ID=$1
    fi
fi

echo "command = $COMMAND"
echo "container = $CONTAINER_ID"