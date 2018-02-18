#!/bin/bash

PROJECT_DIR=$(cd `dirname $0` && pwd)

cd $PROJECT_DIR

BUILD_CONTAINER_DIR=$PROJECT_DIR/build-container
BUILD_CONTAINER_TAG=drbd-build-container:local

docker build -f $BUILD_CONTAINER_DIR//Dockerfile --tag $BUILD_CONTAINER_TAG $BUILD_CONTAINER_DIR

BUILD_DIR=$PROJECT_DIR

mkdir -p $BUILD_DIR

docker run -ti -u $(id -u):$(id -g) -v $PROJECT_DIR:/build \
	$BUILD_CONTAINER_TAG \
	/build-drbd9.sh

