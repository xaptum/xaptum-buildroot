################################################################################
#
# ENFTUN_DATA
#
################################################################################

ENFTUN_DATA_VERSION = 9ffd009cf7fe7e1dbaa2916dca61a3916fcc3dab
ENFTUN_DATA_SITE = ssh://git@github.com/xaptum/xaprc.git
ENFTUN_DATA_SITE_METHOD = git
ENFTUN_DATA_SUPPORTS_IN_SOURCE_BUILD = NO

ENFTUN_DATA_SUBDIR = enftun-data

$(eval $(cmake-package))
