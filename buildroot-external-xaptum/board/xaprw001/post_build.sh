#!/bin/sh

set -e

ROOT_FS=$1

cd "$ROOT_FS"

# cleanup systemd features not done by ./configure --FEATURE=false
rm -f  usr/bin/busctl
#rm -f  usr/bin/systemd-analyze
rm -f  usr/bin/systemd-cat
rm -f  usr/bin/systemd-cgls
rm -f  usr/bin/systemd-cgtop
rm -f  usr/bin/systemd-delta
rm -f  usr/bin/systemd-detect-virt
rm -f  usr/bin/systemd-escape
rm -f  usr/bin/systemd-machine-id-setup
rm -f  usr/bin/systemd-mount
rm -f  usr/bin/systemd-notify
rm -f  usr/bin/systemd-nspawn
rm -f  usr/bin/systemd-path
rm -f  usr/bin/systemd-run
rm -f  usr/bin/systemd-socket-activate
rm -f  usr/bin/systemd-stdio-bridge

# not doing kernel install
rm -fr etc/kernel
rm -f  usr/bin/kernel-install
rm -fr usr/lib/kernel

# no kernel updates
rm -f  usr/lib/systemd/system/systemd-kexec.service

# no systemd-update
rm -f  usr/lib/systemd/system/sysinit.target.wants/systemd-update-done.service
rm -f  usr/lib/systemd/system/system-update.target
rm -f  usr/lib/systemd/system/systemd-update-done.service
rm -f  usr/lib/systemd/system-generators/systemd-system-update-generator
rm -f  usr/lib/systemd/systemd-update-done

# no sleep or hibernate support
rm -f   usr/lib/systemd/systemd-sleep
rm -fr  usr/lib/systemd/system-sleep/
rm -f   usr/lib/systemd/system/systemd-suspend.service

# no containers or virtual machines
rm -f  usr/lib/systemd/system/systemd-nspawn@.service
rm -f  usr/lib/systemd/system/local-fs.target.wants/var-lib-machines.mount
rm -f  usr/lib/systemd/system/var-lib-machines.mount

# no X11 or XDG
rm -fr etc/xdg
rm -fr etc/X11

# no sysvinit legacy
rm -fr etc/init.d
rm -f  usr/lib/systemd/system-generators/systemd-rc-local-generator
rm -f  usr/lib/systemd/system-generators/systemd-sysv-generator
rm -f  usr/lib/systemd/system/sockets.target.wants/systemd-initctl.socket
rm -f  usr/lib/systemd/system/systemd-initctl.service
rm -f  usr/lib/systemd/system/systemd-initctl.socket
rm -f  usr/lib/systemd/systemd-initctl
rm -f  usr/lib/systemd/systemd/halt-local.service
rm -f  usr/lib/systemd/systemd/rc-local.service

# no preset helpers
rm -fr usr/lib/systemd/system-preset
rm -fr usr/share/factory

# serial-getty@ttyS0.service starts automatically,
# serial-getty@console.service just hangs
rm -f etc/systemd/system/getty.target.wants/serial-getty@console.service

device_type=$(cat ${ROOT_FS}/data/mender/device_type | sed 's/[^=]*=//')
artifact_name=$(cat ${ROOT_FS}/etc/mender/artifact_info | sed 's/[^=]*=//')

${HOST_DIR}/usr/bin/mender-artifact write rootfs-image \
    --update ${BINARIES_DIR}/rootfs.ext4 \
    --output-path ${BINARIES_DIR}/${artifact_name}.mender \
    --artifact-name ${artifact_name} \
    --device-type ${device_type}
