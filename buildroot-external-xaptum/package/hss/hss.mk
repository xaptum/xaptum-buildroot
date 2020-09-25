################################################################################
#
# HSS Kernel Patches (a helper package for linux-ext-hss)
#
################################################################################

HSS_VERSION = 434c28f7a83dfa0a792189686b84f1658c18bbe7
HSS_SITE = $(call github,xaptum,hss,$(HSS_VERSION))
HSS_LICENSE_FILES = COPYING
HSS_LICENSE = GPL-2.0

$(eval $(generic-package))

