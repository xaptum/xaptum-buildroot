################################################################################
#
# HSS_NET
#
################################################################################

HSS_NET_VERSION = 7319496680682a61c9a33252359136c339d3f0c6
HSS_NET_SITE = $(call github,xaptum,hss,$(HSS_NET_VERSION))
HSS_NET_LICENSE = GPL-2.0
HSS_NET_DEPENDENCIES = linux

HSS_NET_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)

# kernel-module does not appear to support building a subdir so move it to root
define HSS_NET_MOVE_TO_ROOT
 cp -r $(HSS_NET_DIR)/device/net/* $(HSS_NET_DIR)
endef

HSS_NET_POST_PATCH_HOOKS += HSS_NET_MOVE_TO_ROOT

$(eval $(kernel-module))
$(eval $(generic-package))

