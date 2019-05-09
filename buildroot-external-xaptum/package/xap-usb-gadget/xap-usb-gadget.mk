################################################################################
#
# XAP_USB_GADGET
#
################################################################################

XAP_USB_GADGET_VERSION = af6917fcef2f7977d680435f0a92d1c634a5c61a
XAP_USB_GADGET_SITE = ssh://git@github.com/xaptum/xaprc.git
XAP_USB_GADGET_SITE_METHOD = git
XAP_USB_GADGET_LICENSE = Apache-2.0
XAP_USB_GADGET_LICENSE_FILES = LICENSE
XAP_USB_GADGET_SUPPORTS_IN_SOURCE_BUILD = NO

XAP_USB_GADGET_SUBDIR = xap-usb-gadget

XAP_USB_GADGET_CONF_OPTS += -DXAP_PRODUCT_STR=$(BR2_PACKAGE_XAP_USB_GADGET_PRODUCT_STR)
XAP_USB_GADGET_CONF_OPTS += -DXAP_PRODUCT_ID=$(BR2_PACKAGE_XAP_USB_GADGET_PRODUCT_ID)

$(eval $(cmake-package))
