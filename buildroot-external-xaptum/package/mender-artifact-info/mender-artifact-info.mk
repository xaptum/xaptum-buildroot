################################################################################
#
# MENDER_ARTIFACT_INFO
#
################################################################################

_MAI_PREFIX = $(patsubst "%",%,$(BR2_PACKAGE_MENDER_ARTIFACT_INFO_NAME_PREFIX))
_MAI_VERSION = $(shell cd $(BR2_EXTERNAL_XAPTUM_PATH) && \
                   git describe --dirty --long)

define MENDER_ARTIFACT_INFO_INSTALL_TARGET_CMDS
	@mkdir -p $(TARGET_DIR)/etc/mender
	@rm -f $(TARGET_DIR)/etc/mender/artifact_info
	@echo "artifact_name=$(_MAI_PREFIX)-$(_MAI_VERSION)" > $(TARGET_DIR)/etc/mender/artifact_info
	@chmod 0444 $(TARGET_DIR)/etc/mender/artifact_info
endef

$(eval $(generic-package))

# We want to regenerate the version on every build, in case the
# git-describe output has changed. To force this behavior, override
# the install target to do the install, but not actually create the
# stamp file.
$(BUILD_DIR)/mender-artifact-info/.stamp_target_installed:
	@$(call step_start,install-target)
	@$(call MESSAGE,"Installing to target")
	@mkdir -p $(TARGET_DIR)
	+$(MENDER_ARTIFACT_INFO_INSTALL_TARGET_CMDS)
	@$(call step_end,install-target)
