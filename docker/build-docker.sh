#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-fantasy11pay/fantasy11d-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/fantasy11d docker/bin/
cp $BUILD_DIR/src/fantasy11-cli docker/bin/
cp $BUILD_DIR/src/fantasy11-tx docker/bin/
strip docker/bin/fantasy11d
strip docker/bin/fantasy11-cli
strip docker/bin/fantasy11-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
