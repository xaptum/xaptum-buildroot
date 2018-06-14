################################################################################
#
# xapea00x
#
################################################################################

XAPEA00X_VERSION = v0.1.2
XAPEA00X_SITE = $(call github,xaptum,xapea00x,$(XAPEA00X_VERSION))
XAPEA00X_LICENSE = GPL-2.0

$(eval $(kernel-module))
$(eval $(generic-package))
