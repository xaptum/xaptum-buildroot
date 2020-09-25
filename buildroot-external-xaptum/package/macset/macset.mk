################################################################################
#
# MACSET
#
################################################################################

MACSET_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
MACSET_SITE = $(call github,xaptum,xaprc,$(MACSET_VERSION))
MACSET_SUPPORTS_IN_SOURCE_BUILD = NO
MACSET_LICENSE = GPL-2.0
MACSET_LICENSE_FILES = COPYING

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
