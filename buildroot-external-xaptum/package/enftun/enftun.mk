################################################################################
#
# ENFTUN
#
################################################################################

ENFTUN_VERSION = 5026d90df1d15d273d41c9636bd306fb7f0ec74f
ENFTUN_SITE_METHOD = git
ENFTUN_SITE = git@github.com:dberliner/enftun.git
ENFTUN_LICENSE = Apache-2.0
ENFTUN_LICENSE_FILES = LICENSE
ENFTUN_SUPPORTS_IN_SOURCE_BUILD = NO

ENFTUN_DEPENDENCIES += xtt
ENFTUN_DEPENDENCIES += libconfig
ENFTUN_DEPENDENCIES += libuv
ENFTUN_DEPENDENCIES += libopenssl11

# enftun requires openssl >= v1.1, but that is not available by default on the target;
# the solution is to install openssl v1.1.0h in /opt/openssl11, and make enftun use
# this version
ENFTUN_CONF_OPTS += -DOPENSSL_ROOT_DIR=$(STAGING_DIR)/opt/openssl11
ENFTUN_CONF_OPTS += -DOPENSSL_LIBRARIES=$(STAGING_DIR)/opt/openssl11/lib

# use RPATH to help enftun find the alternative openssl library
ENFTUN_CONF_OPTS += -DCMAKE_INSTALL_RPATH=/opt/openssl11/lib

ENFTUN_CONF_OPTS += -DCHECK_FORMAT=OFF

$(eval $(cmake-package))
