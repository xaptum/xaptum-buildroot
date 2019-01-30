################################################################################
#
# XBRIDGE
#
################################################################################

XBRIDGE_VERSION = c9e5f9fef3146b049e250f93d24d92139241c672
XBRIDGE_SITE = ssh://git@github.com/xaptum/xaprc.git
XBRIDGE_SITE_METHOD = git
XBRIDGE_LICENSE = Apache-2.0
XBRIDGE_LICENSE_FILES = LICENSE
XBRIDGE_SUPPORTS_IN_SOURCE_BUILD = NO

XBRIDGE_DEPENDENCIES += libpcap

XBRIDGE_SUBDIR = xbridge

$(eval $(cmake-package))
