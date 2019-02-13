################################################################################
#
# ETC_HOSTS
#
################################################################################

ETC_HOSTS_VERSION = 22ab669e3a6e25a634210d79b546fd7572bc837a
ETC_HOSTS_SITE = ssh://git@github.com/xaptum/xaprc.git
ETC_HOSTS_SITE_METHOD = git
ETC_HOSTS_SUPPORTS_IN_SOURCE_BUILD = NO

ETC_HOSTS_SUBDIR = etc-hosts

ifeq ($(BR2_PACKAGE_ETC_HOSTS_DEV),y)
	ETC_HOSTS_CONF_OPTS += -DETC_HOSTS_ENV=dev
else ifeq ($(BR2_PACKAGE_ETC_HOSTS_PROD),y)
	ETC_HOSTS_CONF_OPTS += -DETC_HOSTS_ENV=prod
endif

$(eval $(cmake-package))
