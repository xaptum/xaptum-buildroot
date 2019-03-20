################################################################################
#
# XAP_USB_GADGET
#
################################################################################

XAP_USB_GADGET_VERSION = 8ada9bc5d2e802240850c57b185abd5309896270
XAP_USB_GADGET_SITE = ssh://git@github.com/xaptum/xaprc.git
XAP_USB_GADGET_SITE_METHOD = git
XAP_USB_GADGET_LICENSE = Apache-2.0
XAP_USB_GADGET_LICENSE_FILES = LICENSE
XAP_USB_GADGET_SUPPORTS_IN_SOURCE_BUILD = NO

XAP_USB_GADGET_SUBDIR = xap-usb-gadget

$(eval $(cmake-package))
