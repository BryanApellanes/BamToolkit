# Build
FROM microsoft/dotnet:sdk AS build-env

RUN apt-get update \
    && apt-get install -y --no-install-recommends git-core curl build-essential openssl libssl-dev unzip \
    && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /root/.bam/src

WORKDIR /root 

COPY . ./

RUN ./install-nodejs.sh

RUN mv ./_ssh/ ./.ssh \
    && git clone https://github.com/BryanApellanes/BamToolkit.git ./.bam/src/BamToolkit

WORKDIR /root/.bam/src/BamToolkit

ENV DIST=/tmp/bam
RUN ./build-tool.sh bamweb

WORKDIR /root 

ENV ASPNETCORE_ENVIRONMENT=PROD
ENV PATH "$PATH:/root/.bam/toolkit/ubuntu.16.10-x64/bamweb"