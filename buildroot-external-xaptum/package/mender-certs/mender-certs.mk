################################################################################
#
# MENDER_CERTS
#
################################################################################

MENDER_CERTS_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
MENDER_CERTS_SITE = $(call github,xaptum,xaprc,$(MENDER_CERTS_VERSION))
MENDER_CERTS_SUPPORTS_IN_SOURCE_BUILD = NO
MENDER_CERTS_LICENSE = Apache-2.0
MENDER_CERTS_LICENSE_FILES = LICENSE

MENDER_CERTS_SUBDIR = mender-certs

ifeq ($(BR2_PACKAGE_MENDER_CERTS_DEV),y)
	MENDER_CERTS_CONF_OPTS += -DMENDER_ENV=dev
else ifeq ($(BR2_PACKAGE_MENDER_CERTS_PROD),y)
	MENDER_CERTS_CONF_OPTS += -DMENDER_ENV=prod
endif

$(eval $(cmake-package))
