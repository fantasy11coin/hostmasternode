FROM debian:stretch
LABEL maintainer="Fantasy11 Developers <dev@fantasy11.com>"
LABEL description="Dockerised Fantasy11Core, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
