################################################################################
#
# WPA_CREDENTIALS
#
################################################################################

WPA_CREDENTIALS_VERSION = a2d027d7622898abc9f96c52ec3febd584925cd6
WPA_CREDENTIALS_SITE = ssh://git@github.com/xaptum/xaprc.git
WPA_CREDENTIALS_SITE_METHOD = git
WPA_CREDENTIALS_SUPPORTS_IN_SOURCE_BUILD = NO

WPA_CREDENTIALS_SUBDIR = wpa-credentials

WPA_CREDENTIALS_CONF_OPTS += -DXAPRC_SSID=$(BR2_PACKAGE_WPA_CREDENTIALS_SSID)
WPA_CREDENTIALS_CONF_OPTS += -DXAPRC_PASS=$(BR2_PACKAGE_WPA_CREDENTIALS_PASS)

$(eval $(cmake-package))
