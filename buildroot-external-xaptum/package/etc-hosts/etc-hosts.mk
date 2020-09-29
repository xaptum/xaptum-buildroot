################################################################################
#
# ETC_HOSTS
#
################################################################################

ETC_HOSTS_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
ETC_HOSTS_SITE = $(call github,xaptum,xaprc,$(ETC_HOSTS_VERSION))
ETC_HOSTS_SUPPORTS_IN_SOURCE_BUILD = NO
ETC_HOSTS_LICENSE = Apache-2.0

ETC_HOSTS_SUBDIR = etc-hosts

ifeq ($(BR2_PACKAGE_ETC_HOSTS_DEV),y)
	ETC_HOSTS_CONF_OPTS += -DETC_HOSTS_ENV=dev
else ifeq ($(BR2_PACKAGE_ETC_HOSTS_PROD),y)
	ETC_HOSTS_CONF_OPTS += -DETC_HOSTS_ENV=prod
endif

$(eval $(cmake-package))
