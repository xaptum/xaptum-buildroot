################################################################################
#
# HSS Kernel Patches (a helper package for linux-ext-hss)
#
################################################################################

HSS_VERSION = 7319496680682a61c9a33252359136c339d3f0c6
HSS_SITE = $(call github,xaptum,hss,$(HSS_VERSION))
HSS_LICENSE_FILES = COPYING
HSS_LICENSE = GPL-2.0

$(eval $(generic-package))

