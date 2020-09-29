################################################################################
#
# libusbgx
#
################################################################################

LIBUSBGX_CUSTOM_VERSION = f55becd8bbe5ac0af509e4933b728fecc2ccf384
LIBUSBGX_CUSTOM_SITE = $(call github,xaptum,libusbgx,$(LIBUSBGX_CUSTOM_VERSION))
LIBUSBGX_CUSTOM_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
LIBUSBGX_CUSTOM_LICENSE_FILES = COPYING COPYING.LGPL
LIBUSBGX_CUSTOM_DEPENDENCIES = host-pkgconf libconfig
LIBUSBGX_CUSTOM_AUTORECONF = YES
LIBUSBGX_CUSTOM_INSTALL_STAGING = YES

$(eval $(autotools-package))
