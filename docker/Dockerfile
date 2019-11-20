# Build
FROM microsoft/dotnet:sdk AS build-env

RUN apt-get update \
    && apt-get install -y --no-install-recommends git-core curl build-essential openssl libssl-dev unzip \
    && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /root/.bam/src/BamToolkit

WORKDIR /root 

COPY . ./

RUN mv ./_ssh/ ./.ssh \
    && ./install-nodejs.sh \
    && git clone https://github.com/BryanApellanes/BamToolkit.git ./.bam/src/BamToolkit

WORKDIR /root/.bam/src/BamToolkit

ENV DIST=/tmp/bam
ENV SETPATH=false
RUN ./setup.sh

# Runtime
FROM microsoft/dotnet:aspnetcore-runtime

RUN apt-get update \
    && apt-get install -y --no-install-recommends git-core curl build-essential openssl libssl-dev unzip \
    && rm -rf /var/lib/apt/lists/* 

WORKDIR /root

COPY --from=build-env /root/.bam ./

ENV ASPNETCORE_ENVIRONMENT=PROD
ENV PATH "$PATH:/root/.bam/toolkit/bin"
ENTRYPOINT [ "bamweb", "/S", "/content:/root/.bam/content", "/verbose"]

