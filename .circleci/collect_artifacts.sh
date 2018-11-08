#!/bin/bash

set -eo pipefail

DEFCONFIG=$1
VERSION=$DEFCONFIG-$(git describe --long --dirty)

mkdir -p build/$DEFCONFIG/artifacts
cd build/$DEFCONFIG/artifacts

case $DEFCONFIG in

    xaprc001_prov)
        cp ../images/at91bootstrap.bin at91bootstrap-$VERSION.bin
        cp ../images/at91*.dtb at91bootstrap-$VERSION.dtb
        cp ../images/rootfs.cpio rootfs-$VERSION.cpio
        cp ../images/identity.ext2 identity-$VERSION.ext2
        cp ../images/u-boot.bin u-boot-$VERSION.bin
        cp ../images/zImage zImage-$VERSION

        ;;

    *)
        cp ../images/at91bootstrap.bin at91bootstrap-$VERSION.bin
        cp ../images/at91*.dtb at91bootstrap-$VERSION.dtb
        cp ../images/boot.vfat boot-$VERSION.vfat
        cp ../images/data.ext4 data-$VERSION.ext4
        cp ../images/rootfs.ext4 rootfs-$VERSION.ext4
        cp ../images/u-boot.bin u-boot-$VERSION.bin
        cp ../images/zImage zImage-$VERSION
        cp ../images/emmc.img emmc-$VERSION.img
        cp ../images/*.mender artifact-$VERSION.mender

        ;;

esac
