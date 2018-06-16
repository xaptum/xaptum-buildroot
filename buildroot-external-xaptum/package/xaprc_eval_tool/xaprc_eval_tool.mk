################################################################################
#
# xaprc_eval_tool
#
################################################################################

XAPRC_EVAL_TOOL_SITE = $(BR2_EXTERNAL_XAPTUM_PATH)/package/xaprc_eval_tool/source
XAPRC_EVAL_TOOL_SITE_METHOD = local
XAPRC_EVAL_TOOL_LICENSE = Apache-2.0
XAPRC_EVAL_TOOL_LICENSE_FILES = LICENSE

XAPRC_EVAL_TOOL_DEPENDENCIES += libftdi

define HOST_XAPRC_EVAL_TOOL_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
endef

define HOST_XAPRC_EVAL_TOOL_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
endef

$(eval $(host-generic-package))
