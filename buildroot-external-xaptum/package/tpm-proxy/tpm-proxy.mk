################################################################################
#
# TPM_PROXY
#
################################################################################

TPM_PROXY_VERSION = 1ce513dedd864092867f95ce54bb73d05702a1a3
TPM_PROXY_SITE = $(call github,xaptum,tpm-proxy,$(TPM_PROXY_VERSION))
TPM_PROXY_LICENSE = GPL-2.0
TPM_PROXY_LICENSE_FILES = COPYING
TPM_PROXY_SUPPORTS_IN_SOURCE_BUILD = NO

TPM_PROXY_SUBDIR = gadget

#Disable pthreads from testing because we are cross-compiling
TPM_PROXY_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

$(eval $(cmake-package))

