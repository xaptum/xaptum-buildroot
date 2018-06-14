#!/bin/sh

set -e

ROOT_FS=$1

cd "$ROOT_FS"

# cleanup systemd features not done by ./configure --FEATURE=false
rm -f  usr/bin/busctl
rm -f  usr/bin/systemd-analyze
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

# no journald
# rm -f  etc/systemd/journald.conf
# rm -f  usr/bin/journalctl
# rm -f  usr/lib/systemd/systemd-journald
# rm -f  usr/lib/systemd/system/sockets.target.wants/systemd-journald-audit.socket
# rm -f  usr/lib/systemd/system/sockets.target.wants/systemd-journald-dev-log.socket
# rm -f  usr/lib/systemd/system/sockets.target.wants/systemd-journald.socket
# rm -f  usr/lib/systemd/system/sysinit.target.wants/systemd-journal-catalog-update.service
# rm -f  usr/lib/systemd/system/sysinit.target.wants/systemd-journald.service
# rm -f  usr/lib/systemd/system/sysinit.target.wants/systemd-journal-flush.service
# rm -f  usr/lib/systemd/system/systemd-journal-catalog-update.service
# rm -f  usr/lib/systemd/system/systemd-journald-audit.socket
# rm -f  usr/lib/systemd/system/systemd-journald-dev-log.socket
# rm -f  usr/lib/systemd/system/systemd-journald.service
# rm -f  usr/lib/systemd/system/systemd-journald.socket
# rm -f  usr/lib/systemd/system/systemd-journal-flush.service
# rm -fr usr/lib/systemd/catalog/
# rm -fr var/log/

# no udev
# rm -fr etc/udev
# rm -f  etc/udev/udev.conf
# rm -f  usr/bin/udevadm
# rm -f  usr/lib/libudev.so*
# rm -f  usr/lib/systemd/system/initrd-udevadm-cleanup-db.service
# rm -f  usr/lib/systemd/system/sockets.target.wants/systemd-udevd-control.socket
# rm -f  usr/lib/systemd/system/sockets.target.wants/systemd-udevd-kernel.socket
# rm -f  usr/lib/systemd/system/sysinit.target.wants/systemd-udev-trigger.service
# rm -f  usr/lib/systemd/system/sysinit.target.wants/systemd-udevd.service
# rm -f  usr/lib/systemd/system/systemd-hwdb-update.service
# rm -f  usr/lib/systemd/system/systemd-udev-settle.service
# rm -f  usr/lib/systemd/system/systemd-udev-trigger.service
# rm -f  usr/lib/systemd/system/systemd-udevd-control.socket
# rm -f  usr/lib/systemd/system/systemd-udevd-kernel.socket
# rm -f  usr/lib/systemd/system/systemd-udevd.service
# rm -f  usr/lib/systemd/systemd-udevd
# rm -fr usr/lib/udev
