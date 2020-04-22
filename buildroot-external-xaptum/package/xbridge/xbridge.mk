################################################################################
#
# XBRIDGE
#
################################################################################

XBRIDGE_VERSION = 9ffd009cf7fe7e1dbaa2916dca61a3916fcc3dab
XBRIDGE_SITE = ssh://git@github.com/xaptum/xaprc.git
XBRIDGE_SITE_METHOD = git
XBRIDGE_LICENSE = Apache-2.0
XBRIDGE_LICENSE_FILES = LICENSE
XBRIDGE_SUPPORTS_IN_SOURCE_BUILD = NO

XBRIDGE_DEPENDENCIES += libpcap

XBRIDGE_SUBDIR = xbridge

$(eval $(cmake-package))
