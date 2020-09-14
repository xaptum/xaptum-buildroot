################################################################################
#
# HSS Kernel Patches (a helper package for linux-ext-hss)
#
################################################################################

HSS_VERSION = aca2099f582a3cbd16330a686409a43b05dc3748
HSS_SITE = $(call github,xaptum,hss,$(HSS_VERSION))
HSS_LICENSE = Apache-2.0
HSS_LICENSE_FILES = LICENSE

$(eval $(generic-package))

