################################################################################
#
# MENDER_CERTS
#
################################################################################

MENDER_CERTS_VERSION = 01e99131e739b1cd229c6cf72a0e401d37f64c56
MENDER_CERTS_SITE = ssh://git@github.com/xaptum/xaprc.git
MENDER_CERTS_SITE_METHOD = git
MENDER_CERTS_SUPPORTS_IN_SOURCE_BUILD = NO

MENDER_CERTS_SUBDIR = mender-certs

ifeq ($(BR2_PACKAGE_MENDER_CERTS_DEV),y)
	MENDER_CERTS_CONF_OPTS += -DMENDER_ENV=dev
else ifeq ($(BR2_PACKAGE_MENDER_CERTS_PROD),y)
	MENDER_CERTS_CONF_OPTS += -DMENDER_ENV=prod
endif

$(eval $(cmake-package))
