################################################################################
#
# MENDER_IDENTITY
#
################################################################################

MENDER_IDENTITY_VERSION = cd10f5a6fd8014bd9dc37f7f91ee9d3b72966309
MENDER_IDENTITY_SITE = ssh://git@github.com/xaptum/xaprc.git
MENDER_IDENTITY_SITE_METHOD = git
MENDER_IDENTITY_SUPPORTS_IN_SOURCE_BUILD = NO

MENDER_IDENTITY_SUBDIR = mender-identity

$(eval $(cmake-package))
