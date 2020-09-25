################################################################################
#
# ENFTUN_DATA
#
################################################################################

ENFTUN_DATA_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
ENFTUN_DATA_SITE = $(call github,xaptum,xaprc,$(ENFTUN_DATA_VERSION))
ENFTUN_DATA_SUPPORTS_IN_SOURCE_BUILD = NO
ENFTUN_DATA_LICENSE = Apache-2.0

ENFTUN_DATA_SUBDIR = enftun-data

$(eval $(cmake-package))
