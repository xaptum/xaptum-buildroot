################################################################################
#
# GT
#
################################################################################

GT_VERSION = ed35e2fb6a3e09832035f863807aa9a8a30bbc46
GT_SITE = $(call github,kopasiak,gt,$(GT_VERSION))
GT_LICENSE = Apache-2.0
GT_LICENSE_FILES = LICENSE
GT_SUPPORTS_IN_SOURCE_BUILD = NO
GT_SUBDIR=source
GT_DEPENDENCIES = \
	libconfig \
	libglib2 \
	libusbgx

GT_CONF_OPTS += -DCONFDIR=/etc/gt
GT_CONF_OPTS += -DRUNTIME_CONFDIR=/etc/gt

$(eval $(cmake-package))
