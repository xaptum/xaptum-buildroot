################################################################################
#
# TPM_PROXY
#
################################################################################

TPM_PROXY_VERSION = 09c5c42b1020ae9e774146798ab6de64140c3f07
TPM_PROXY_SITE = ssh://git@github.com/xaptum/tpm-proxy.git
TPM_PROXY_SITE_METHOD = git
TPM_PROXY_LICENSE = GPL-2.0
TPM_PROXY_SUPPORTS_IN_SOURCE_BUILD = NO

TPM_PROXY_SUBDIR = gadget

#Disable pthreads from testing because we are cross-compiling
TPM_PROXY_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

$(eval $(cmake-package))

