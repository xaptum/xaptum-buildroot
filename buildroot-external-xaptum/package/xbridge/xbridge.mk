################################################################################
#
# XBRIDGE
#
################################################################################

XBRIDGE_VERSION = af6917fcef2f7977d680435f0a92d1c634a5c61a
XBRIDGE_SITE = ssh://git@github.com/xaptum/xaprc.git
XBRIDGE_SITE_METHOD = git
XBRIDGE_LICENSE = Apache-2.0
XBRIDGE_LICENSE_FILES = LICENSE
XBRIDGE_SUPPORTS_IN_SOURCE_BUILD = NO

XBRIDGE_DEPENDENCIES += libpcap

XBRIDGE_SUBDIR = xbridge

$(eval $(cmake-package))
