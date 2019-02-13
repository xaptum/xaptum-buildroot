################################################################################
#
# MENDER_IDENTITY
#
################################################################################

MENDER_IDENTITY_VERSION = aef4c1d606b79e1cdb514d3d0e9e166d558271c9
MENDER_IDENTITY_SITE = ssh://git@github.com/xaptum/xaprc.git
MENDER_IDENTITY_SITE_METHOD = git
MENDER_IDENTITY_SUPPORTS_IN_SOURCE_BUILD = NO

MENDER_IDENTITY_SUBDIR = mender-identity

$(eval $(cmake-package))
