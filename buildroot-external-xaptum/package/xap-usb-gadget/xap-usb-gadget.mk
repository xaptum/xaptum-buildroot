################################################################################
#
# XAP_USB_GADGET
#
################################################################################

XAP_USB_GADGET_VERSION = c5296a943fe18c9b99bed06d67177d3e19021ce5
XAP_USB_GADGET_SITE = ssh://git@github.com/xaptum/xaprc.git
XAP_USB_GADGET_SITE_METHOD = git
XAP_USB_GADGET_LICENSE = Apache-2.0
XAP_USB_GADGET_LICENSE_FILES = LICENSE
XAP_USB_GADGET_SUPPORTS_IN_SOURCE_BUILD = NO

XAP_USB_GADGET_SUBDIR = xap-usb-gadget

XAP_USB_GADGET_CONF_OPTS += -DXAP_PRODUCT_STR=$(BR2_PACKAGE_XAP_USB_GADGET_PRODUCT_STR)
XAP_USB_GADGET_CONF_OPTS += -DXAP_PRODUCT_ID=$(BR2_PACKAGE_XAP_USB_GADGET_PRODUCT_ID)

ifeq ($(BR2_PACKAGE_XAP_USB_GADGET_SERIAL),y)
       XAP_USB_GADGET_CONF_OPTS += -DENABLE_SERIAL_CONSOLE=ON
endif

$(eval $(cmake-package))
