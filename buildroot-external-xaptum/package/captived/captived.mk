################################################################################
#
# CAPTIVED
#
################################################################################

CAPTIVED_VERSION = dee7eb15f8986b8784bd7fe435beaf824f14088f
CAPTIVED_SITE = ssh://git@github.com/xaptum/xaprc.git
CAPTIVED_SITE_METHOD = git
CAPTIVED_SUPPORTS_IN_SOURCE_BUILD = NO

CAPTIVED_SUBDIR = captived

$(eval $(cmake-package))

