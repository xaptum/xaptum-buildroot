#!/bin/sh

set -e

device_type=$(cat ${TARGET_DIR}/data/mender/device_type | sed 's/[^=]*=//')
artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')

if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
    exit 1
fi

${HOST_DIR}/bin/mender-artifact write rootfs-image \
    --file ${BINARIES_DIR}/rootfs.ext4 \
    --output-path ${BINARIES_DIR}/${artifact_name}.mender \
    --artifact-name ${artifact_name} \
    --device-type ${device_type} \
    --version 2
