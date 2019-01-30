#!/bin/sh

set -e

device_type=$(cat ${TARGET_DIR}/data/mender/device_type | sed 's/[^=]*=//')
artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')

if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
    echo "missing files required by Mender (/etc/data/mender/device_type or /etc/mender/artifact_info)"
    exit 1
fi

${HOST_DIR}/bin/host-mender-artifact write rootfs-image \
    --update ${BINARIES_DIR}/rootfs.ext4 \
    --output-path ${BINARIES_DIR}/${artifact_name}.mender \
    --artifact-name ${artifact_name} \
    --device-type ${device_type}
