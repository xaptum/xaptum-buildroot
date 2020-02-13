################################################################################
#
# libusbgx
#
################################################################################

LIBUSBGX_CUSTOM_VERSION = 7b9230400480e3ca555cb4813502f4a05701c557
LIBUSBGX_CUSTOM_SITE = ssh://git@github.com/xaptum/libusbgx.git
LIBUSBGX_CUSTOM_SITE_METHOD = git
LIBUSBGX_CUSTOM_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
LIBUSBGX_CUSTOM_LICENSE_FILES = COPYING COPYING.LGPL
LIBUSBGX_CUSTOM_DEPENDENCIES = host-pkgconf libconfig
LIBUSBGX_CUSTOM_AUTORECONF = YES
LIBUSBGX_CUSTOM_INSTALL_STAGING = YES

$(eval $(autotools-package))
