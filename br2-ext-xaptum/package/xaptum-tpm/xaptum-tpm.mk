################################################################################
#
# xaptum-tpm
#
################################################################################

XAPTUM_TPM_VERSION = v0.4.1
XAPTUM_TPM_SITE = $(call github,xaptum,xaptum-tpm,$(XAPTUM_TPM_VERSION))
XAPTUM_TPM_LICENSE = Apache-2.0
XAPTUM_TPM_LICENSE_FILES = LICENSE
XAPTUM_TPM_INSTALL_STAGING = YES

$(eval $(cmake-package))
