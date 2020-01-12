#!/bin/bash

if [[ -z $TESTBIN ]]; then
    TESTBIN=/tmp/bam/tests
fi

bamtest /dir:${TESTBIN} /search:*Tests.* /type:Unit /data:/root/.bam/tests/results 