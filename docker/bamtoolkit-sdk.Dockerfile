# Build
FROM microsoft/dotnet:sdk AS build-env

RUN apt-get update \
    && apt-get install -y --no-install-recommends git-core curl build-essential openssl libssl-dev unzip python3 \
    && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /root/.bam/src

WORKDIR /root 

COPY . ./

RUN ./install-nodejs.sh

RUN mv ./_ssh/ ./.ssh \
    && git clone https://github.com/BryanApellanes/BamToolkit.git ./.bam/src/BamToolkit

WORKDIR /root/.bam/src/BamToolkit

ENV DIST=/tmp/bam
ENV BAMTOOLKITSYMLINKS=/usr/local/bin
RUN ./build.sh \
    && ./install.sh \
    && ./symlink-toolkit.sh

WORKDIR /root 

ENV ASPNETCORE_ENVIRONMENT=PROD
ENV PATH "$PATH:/usr/local/bin"