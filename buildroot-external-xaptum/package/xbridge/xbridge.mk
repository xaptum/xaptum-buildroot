################################################################################
#
# XBRIDGE
#
################################################################################

XBRIDGE_VERSION = 13af8cc96caf3946e9e4ab46b8d11b2b58656613
XBRIDGE_SITE = ssh://git@github.com/xaptum/xaprc.git
XBRIDGE_SITE_METHOD = git
XBRIDGE_LICENSE = Apache-2.0
XBRIDGE_LICENSE_FILES = LICENSE
XBRIDGE_SUPPORTS_IN_SOURCE_BUILD = NO

XBRIDGE_DEPENDENCIES += libpcap

XBRIDGE_SUBDIR = xbridge

$(eval $(cmake-package))
