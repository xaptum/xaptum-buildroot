#!/bin/bash

set -eo pipefail

DEFCONFIG=$1
VERSION=$DEFCONFIG-$(git describe --long --dirty)

echo "DEFCONFIG = $DEFCONFIG"
echo "VERSION = $VERSION"

cd build/$DEFCONFIG/artifacts
echo currently in directory: `pwd`

ORIG=artifact-$VERSION.mender
SIGN=artifact-signed-$VERSION.mender
TEMP=$SIGN.tmp
echo ORIG = $ORIG
echo SIGN = $SIGN

cp $ORIG $TEMP
mender-artifact sign $TEMP -k ../../../.circleci/dev-xaptum-mender-code-signer.key
mv $TEMP $SIGN
