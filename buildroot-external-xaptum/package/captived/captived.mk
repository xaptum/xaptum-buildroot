################################################################################
#
# CAPTIVED
#
################################################################################

CAPTIVED_VERSION = 2244270756c0a0c87e471bd58777b7cde87d40d5
CAPTIVED_SITE = $(call github,xaptum,xaprc,$(CAPTIVED_VERSION))
CAPTIVED_SUPPORTS_IN_SOURCE_BUILD = NO
CAPTIVED_LICENSE = Apache-2.0
CAPTIVED_SUBDIR = captived

CAPTIVED_DEPENDENCIES += libevent jansson

CAPTIVED_CONF_OPTS += -DCHECK_FORMAT=OFF

define CAPTIVED_INSTALL_INIT_SYSTEMD
        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
        ln -fs ../../../../usr/lib/systemd/system/captived.service \
               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/captived.service
endef

$(eval $(cmake-package))
