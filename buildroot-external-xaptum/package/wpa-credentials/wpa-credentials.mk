################################################################################
#
# WPA_CREDENTIALS
#
################################################################################

WPA_CREDENTIALS_VERSION = f648290ac569cdcb989dd7d27018fd3b3a09525a
WPA_CREDENTIALS_SITE = $(call github,xaptum,xaprc,$(WPA_CREDENTIALS_VERSION))
WPA_CREDENTIALS_SUPPORTS_IN_SOURCE_BUILD = NO
WPA_CREDENTIALS_LICENSE = GPL-2.0
WPA_CREDENTIALS_LICENSE_FILES = COPYING

WPA_CREDENTIALS_SUBDIR = wpa-credentials

WPA_CREDENTIALS_CONF_OPTS += -DXAPRC_SSID=$(BR2_PACKAGE_WPA_CREDENTIALS_SSID)
WPA_CREDENTIALS_CONF_OPTS += -DXAPRC_PASS=$(BR2_PACKAGE_WPA_CREDENTIALS_PASS)

$(eval $(cmake-package))
