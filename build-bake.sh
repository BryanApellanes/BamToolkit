#!/bin/bash

source ./get-os-runtime.sh

dotnet publish ./Bam.Net.Core/_tools/bake/bake.csproj -c Release -r $RUNTIME -o ~/.bam/bake