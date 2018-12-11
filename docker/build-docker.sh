#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-betfintpay/betfintd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/betfintd docker/bin/
cp $BUILD_DIR/src/betfint-cli docker/bin/
cp $BUILD_DIR/src/betfint-tx docker/bin/
strip docker/bin/betfintd
strip docker/bin/betfint-cli
strip docker/bin/betfint-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
