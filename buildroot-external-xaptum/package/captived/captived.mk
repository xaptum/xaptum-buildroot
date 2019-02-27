################################################################################
#
# CAPTIVED
#
################################################################################

CAPTIVED_VERSION = 47a2c6c68f026ae447d87c8ad4e128f93c728a44
CAPTIVED_SITE = ssh://git@github.com/xaptum/xaprc.git
CAPTIVED_SITE_METHOD = git
CAPTIVED_SUPPORTS_IN_SOURCE_BUILD = NO

CAPTIVED_SUBDIR = captived

$(eval $(cmake-package))

