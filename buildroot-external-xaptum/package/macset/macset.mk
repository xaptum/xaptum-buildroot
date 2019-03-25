################################################################################
#
# MACSET
#
################################################################################

MACSET_VERSION = 43a6b9d53c3bbb2763c69d037622174a98184b49
MACSET_SITE = ssh://git@github.com/xaptum/xaprc.git
MACSET_SITE_METHOD = git
MACSET_SUPPORTS_IN_SOURCE_BUILD = NO

MACSET_SUBDIR = macset

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
	MACSET_CONF_OPTS += -DBUILD_SYSTEMD=ON
else
	MACSET_CONF_OPTS += -DBUILD_SYSTEMD=OFF
endif

ifeq ($(BR2_PACKAGE_MACSET_WLAN0),y)
	MACSET_CONF_OPTS += -DBUILD_WLAN0=ON
else
	MACSET_CONF_OPTS += -DBUILD_WLAN0=OFF
endif

ifeq ($(BR2_PACKAGE_MACSET_WLAN0),y)
define MACSET_INSTALL_INIT_SYSTEMD
	ln -sf ../../../../usr/lib/systemd/system/macset@.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/macset@wlan0.service
endef
endif

$(eval $(cmake-package))
