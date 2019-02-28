################################################################################
#
# CAPTIVED
#
################################################################################

CAPTIVED_VERSION = e7680a5e8564e61a0f53bf0a16fb703e1c2268ca
CAPTIVED_SITE = ssh://git@github.com/xaptum/xaprc.git
CAPTIVED_SITE_METHOD = git
CAPTIVED_SUPPORTS_IN_SOURCE_BUILD = NO

CAPTIVED_SUBDIR = captived

$(eval $(cmake-package))

