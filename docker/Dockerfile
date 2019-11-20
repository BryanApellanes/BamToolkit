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
ENV SETPATH=false
RUN ./setup.sh

WORKDIR /root 
RUN rm -fr /root/.bam/src

# Runtime
FROM microsoft/dotnet:aspnetcore-runtime

RUN apt-get update \
    && apt-get install -y --no-install-recommends git-core curl build-essential openssl libssl-dev unzip \
    && rm -rf /var/lib/apt/lists/* 

WORKDIR /root

COPY --from=build-env /root/.bam ./.bam

ENV ASPNETCORE_ENVIRONMENT=PROD
ENV PATH "$PATH:/root/.bam/toolkit/bin"