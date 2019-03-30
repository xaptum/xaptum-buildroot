#!/bin/bash

set -eo pipefail

DEFCONFIG=$1
VERSION=$DEFCONFIG-$(git describe --long --dirty)

cd build/$DEFCONFIG/artifacts

SIGN=artifact-signed-$VERSION.mender

mender-cli artifacts --server https://mender.xaptum.xyz upload $SIGN
