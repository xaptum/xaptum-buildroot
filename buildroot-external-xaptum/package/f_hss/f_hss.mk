################################################################################
#
# F_HSS
#
################################################################################

F_HSS_VERSION = 434c28f7a83dfa0a792189686b84f1658c18bbe7
F_HSS_SITE = $(call github,xaptum,hss,$(F_HSS_VERSION))
F_HSS_LICENSE = GPL-2.0
F_HSS_DEPENDENCIES += hss-net linux
F_HSS_MODULE_MAKE_OPTS = \
	KERNELDIR=$(LINUX_DIR) \
	EXTRA_CFLAGS=-I$(LINUX_DIR)/drivers/usb/gadget/
F_HSS_LICENSE = GPL-2.0

# This build must be aware of the HSS proxys functions -- currently part of the HSS network device
define F_HSS_MOVE_NET_SYMS
	cp $(HSS_NET_DIR)/Module.symvers $(F_HSS_DIR)
endef

# kernel-module does not appear to support building a subdir so move it to root
define F_HSS_MOVE_TO_ROOT
 cp -r $(F_HSS_DIR)/device/gadget/* $(F_HSS_DIR)
endef

F_HSS_POST_PATCH_HOOKS += \
	F_HSS_MOVE_TO_ROOT \
	F_HSS_MOVE_NET_SYMS

$(eval $(kernel-module))
$(eval $(generic-package))

