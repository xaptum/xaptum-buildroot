################################################################################
#
# ENFTUN_CMD
#
################################################################################

ENFTUN_CMD_VERSION = 9ffd009cf7fe7e1dbaa2916dca61a3916fcc3dab
ENFTUN_CMD_SITE = ssh://git@github.com/xaptum/xaprc.git
ENFTUN_CMD_SITE_METHOD = git
ENFTUN_CMD_SUPPORTS_IN_SOURCE_BUILD = NO

ENFTUN_CMD_SUBDIR = enftun-cmd

$(eval $(cmake-package))
