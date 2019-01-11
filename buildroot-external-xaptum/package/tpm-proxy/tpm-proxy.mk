################################################################################
#
# TPM_PROXY
#
################################################################################

TPM_PROXY_VERSION = 76c70813c0ae6c2ae86e3f01ac6da34dbcdd3d38
TPM_PROXY_SITE = ssh://git@github.com/xaptum/tpm-proxy.git
TPM_PROXY_SITE_METHOD = git
TPM_PROXY_LICENSE = GPL-2.0
TPM_PROXY_SUPPORTS_IN_SOURCE_BUILD = NO

TPM_PROXY_SUBDIR = gadget

#Disable pthreads from testing because we are cross-compiling
TPM_PROXY_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

$(eval $(cmake-package))

