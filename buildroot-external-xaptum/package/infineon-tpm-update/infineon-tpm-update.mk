################################################################################
#
# infineon-tpm-udpate
#
################################################################################

INFINEON_TPM_UPDATE_VERSION = e28d778a71e070ab265793153e3796998166b0af
INFINEON_TPM_UPDATE_SITE = $(call github,xaptum,infineon-tpm-update,$(INFINEON_TPM_UPDATE_VERSION))
INFINEON_TPM_UPDATE_DEPENDENCIES += openssl

define INFINEON_TPM_UPDATE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
endef

define INFINEON_TPM_UPDATE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/TPMFactoryUpd $(TARGET_DIR)/usr/bin/TPMFactoryUpd
endef

$(eval $(generic-package))
