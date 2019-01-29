################################################################################
#
# xaptum-tpm
#
################################################################################

XAPTUM_TPM_VERSION = v0.5.8
XAPTUM_TPM_SITE = $(call github,xaptum,xaptum-tpm,$(XAPTUM_TPM_VERSION))
XAPTUM_TPM_LICENSE = Apache-2.0
XAPTUM_TPM_LICENSE_FILES = LICENSE
XAPTUM_TPM_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_XAPTUM_TPM_UTILS),y)
	XAPTUM_TPM_CONFIG_OPTS += -DBUILD_UTILS=ON
else
	XAPTUM_TPM_CONFIG_OPTS += -DBUILD_UTILS=OFF
endif

$(eval $(cmake-package))
