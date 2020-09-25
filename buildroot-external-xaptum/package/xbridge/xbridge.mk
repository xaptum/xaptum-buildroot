################################################################################
#
# XBRIDGE
#
################################################################################

XBRIDGE_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
XBRIDGE_SITE = $(call github,xaptum,xaprc,$(XBRIDGE_VERSION))
XBRIDGE_LICENSE = Apache-2.0
XBRIDGE_LICENSE_FILES = LICENSE
XBRIDGE_SUPPORTS_IN_SOURCE_BUILD = NO

XBRIDGE_DEPENDENCIES += libpcap

XBRIDGE_SUBDIR = xbridge

$(eval $(cmake-package))
