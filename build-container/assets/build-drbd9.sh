#!/bin/bash -e

BUILD_DIR=/build/build/
mkdir -p $BUILD_DIR

for p in drbd-9.0.git drbdmanage.git drbd-utils.git; do
  echo "Cloning/updating $p..."
  if [ ! -d "$BUILD_DIR/$p" ]; then
    git clone --recursive https://github.com/LINBIT/$p $BUILD_DIR/$p
  fi
done

cd $BUILD_DIR/drbd-9.0.git && \
	make clean && \
	KVER=4.9.0-5-amd64 make && \
	dpkg-buildpackage -rfakeroot -b -uc
 
cd $BUILD_DIR/drbdmanage.git && \
	dpkg-buildpackage -rfakeroot -b -uc

cd $BUILD_DIR/drbd-utils.git && \
	./autogen.sh && \
	dpkg-buildpackage -rfakeroot -b -uc
