################################################################################
#
# shellcat
#
################################################################################

SHELLCAT_VERSION = 1.2
SHELLCAT_SITE = $(call github,jwilk,shellcat,$(SHELLCAT_VERSION))
SHELLCAT_LICENSE = MIT
SHELLCAT_LICENSE_FILES = LICENSE
SHELLCAT_INSTALL_STAGING = NO
SHELLCAT_INSTALL_TARGET = YES

SHELLCAT_CONF_OPTS += PREFIX=/usr

define SHELLCAT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(SHELLCAT_CONF_OPTS) -C $(@D) all
endef

define SHELLCAT_INSTALL_TARGET_CMDS
	$(MAKE) $(SHELLCAT_CONF_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
endef

$(eval $(generic-package))
