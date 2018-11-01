################################################################################
#
# XBRIDGE
#
################################################################################

XBRIDGE_VERSION = 1796d95247ec0129a924f68dc987120e9e5a3aee
XBRIDGE_SITE = ssh://git@github.com/xaptum/xaprc.git
XBRIDGE_SITE_METHOD = git
XBRIDGE_LICENSE = Apache-2.0
XBRIDGE_LICENSE_FILES = LICENSE
XBRIDGE_SUPPORTS_IN_SOURCE_BUILD = NO

XBRIDGE_DEPENDENCIES += libpcap

XBRIDGE_SUBDIR = xbridge

$(eval $(cmake-package))
