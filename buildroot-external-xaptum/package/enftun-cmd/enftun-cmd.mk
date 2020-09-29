################################################################################
#
# ENFTUN_CMD
#
################################################################################

ENFTUN_CMD_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
ENFTUN_CMD_SITE = $(call github,xaptum,xaprc,$(ENFTUN_CMD_VERSION))
ENFTUN_CMD_SUPPORTS_IN_SOURCE_BUILD = NO
ENFTUN_CMD_LICENSE = Apache-2.0

ENFTUN_CMD_SUBDIR = enftun-cmd

$(eval $(cmake-package))
