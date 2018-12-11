FROM debian:stretch
LABEL maintainer="Betfint Developers <dev@betfint.com>"
LABEL description="Dockerised BetfintCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
