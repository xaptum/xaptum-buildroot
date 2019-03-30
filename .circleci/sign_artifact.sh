#!/bin/bash

set -eo pipefail

DEFCONFIG=$1
VERSION=$DEFCONFIG-$(git describe --long --dirty)

cd build/$DEFCONFIG/artifacts

ORIG=artifact-$VERSION.mender
SIGN=artifact-signed-$VERSION.mender
TEMP=$SIGN.tmp

cp $ORIG $TEMP
mender-artifact sign $TEMP -k ../../../.circleci/dev-xaptum-mender-code-signer.key
mv $TEMP $SIGN
