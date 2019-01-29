################################################################################
#
# XTT
#
################################################################################

XTT_VERSION = v0.10.2
XTT_SITE = $(call github,xaptum,xtt,$(XTT_VERSION))
XTT_LICENSE = Apache-2.0
XTT_LICENSE_FILES = LICENSE
XTT_INSTALL_STAGING = YES
XTT_SUPPORTS_IN_SOURCE_BUILD = NO

XTT_DEPENDENCIES += ecdaa libsodium
XTT_DEPENDENCIES += $(if $(BR2_PACKAGE_XTT_TPM_SUPPORT),xaptum-tpm,)

ifeq ($(BR2_PACKAGE_XTT_TPM_SUPPORT),y)
	XTT_CONF_OPTS += -DUSE_TPM=ON
else
	XTT_CONF_OPTS += -DUSE_TPM=OFF
endif

ifeq ($(BR2_PACKAGE_XTT_UTILS),y)
	XTT_CONF_OPTS += -DBUILD_EXAMPLES=ON
	XTT_CONF_OPTS += -DBUILD_UTILS=ON
else
	XTT_CONF_OPTS += -DBUILD_EXAMPLES=OFF
	XTT_CONF_OPTS += -DBUILD_UTILS=OFF
endif

$(eval $(cmake-package))
