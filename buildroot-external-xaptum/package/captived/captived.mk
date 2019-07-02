################################################################################
#
# CAPTIVED
#
################################################################################

CAPTIVED_VERSION = 7cbd8604df5fadaebb327682e3e72fdf0dfa8427
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
