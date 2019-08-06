################################################################################
#
# CAPTIVED
#
################################################################################

CAPTIVED_VERSION = 2cc27fe54e72b8a8cbfc6f10eebd0ffaa30ffffa
CAPTIVED_SITE = ssh://git@github.com/xaptum/xaprc.git
CAPTIVED_SITE_METHOD = git
CAPTIVED_SUPPORTS_IN_SOURCE_BUILD = NO

CAPTIVED_SUBDIR = captived

CAPTIVED_DEPENDENCIES += libevent jansson

CAPTIVED_CONF_OPTS += -DCHECK_FORMAT=OFF

define CAPTIVED_INSTALL_INIT_SYSTEMD
        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
        ln -fs ../../../../usr/lib/systemd/system/captived.service \
               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/captived.service
endef

$(eval $(cmake-package))
