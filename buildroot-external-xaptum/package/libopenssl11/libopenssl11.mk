################################################################################
#
# libopenssl11
#
################################################################################

LIBOPENSSL11_VERSION = 1.1.0
LIBOPENSSL11_REVISION = h
LIBOPENSSL11_SITE = http://www.openssl.org/source/old/$(LIBOPENSSL11_VERSION)
LIBOPENSSL11_SOURCE = openssl-$(LIBOPENSSL11_VERSION)$(LIBOPENSSL11_REVISION).tar.gz
LIBOPENSSL11_LICENSE = OpenSSL or SSLeay
LIBOPENSSL11_LICENSE_FILES = LICENSE
LIBOPENSSL11_INSTALL_STAGING = YES
LIBOPENSSL11_DEPENDENCIES = zlib
HOST_LIBOPENSSL11_DEPENDENCIES = host-zlib
LIBOPENSSL11_TARGET_ARCH = generic32
LIBOPENSSL11_CFLAGS = $(TARGET_CFLAGS)

# relocation truncated to fit: R_68K_GOT16O
ifeq ($(BR2_m68k_cf),y)
LIBOPENSSL11_CFLAGS += -mxgot
endif

ifeq ($(BR2_USE_MMU),)
LIBOPENSSL11_CFLAGS += -DHAVE_FORK=0
endif

ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
LIBOPENSSL11_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
LIBOPENSSL11_DEPENDENCIES += cryptodev
endif

# fixes the following build failures:
#
# - musl
#   ./libcrypto.so: undefined reference to `getcontext'
#   ./libcrypto.so: undefined reference to `setcontext'
#   ./libcrypto.so: undefined reference to `makecontext'
#
# - uclibc:
#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name ‘ucontext_t’
#
ifneq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_USES_UCLIBC),)
LIBOPENSSL11_CFLAGS += -DOPENSSL_NO_ASYNC
endif

# Some architectures are optimized in OpenSSL
# Doesn't work for thumb-only (Cortex-M?)
ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
LIBOPENSSL11_TARGET_ARCH = armv4
endif
ifeq ($(ARCH),aarch64)
LIBOPENSSL11_TARGET_ARCH = aarch64
endif
ifeq ($(ARCH),powerpc)
# 4xx cores seem to have trouble with openssl's ASM optimizations
ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
LIBOPENSSL11_TARGET_ARCH = ppc
endif
endif
ifeq ($(ARCH),powerpc64)
LIBOPENSSL11_TARGET_ARCH = ppc64
endif
ifeq ($(ARCH),powerpc64le)
LIBOPENSSL11_TARGET_ARCH = ppc64le
endif
ifeq ($(ARCH),x86_64)
LIBOPENSSL11_TARGET_ARCH = x86_64
endif

define HOST_LIBOPENSSL11_CONFIGURE_CMDS
	(cd $(@D); \
		$(HOST_CONFIGURE_OPTS) \
		./config \
		--prefix=$(HOST_DIR) \
		--openssldir=$(HOST_DIR)/etc/ssl \
		--libdir=/lib \
		-Wl,-rpath,'$(HOST_DIR)/lib' \
		shared \
		zlib-dynamic \
	)
	$(SED) "s#-O[0-9]#$(HOST_CFLAGS)#" $(@D)/Makefile
endef

define LIBOPENSSL11_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_ARGS) \
		$(TARGET_CONFIGURE_OPTS) \
		./Configure \
			linux-$(LIBOPENSSL11_TARGET_ARCH) \
			--prefix=/opt/openssl11 \
			--openssldir=/opt/openssl11/etc/ssl \
			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
			no-rc5 \
			enable-camellia \
			enable-mdc2 \
			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
			$(if $(BR2_STATIC_LIBS),no-dso) \
	)
	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
	$(SED) "s#-O[0-9]#$(LIBOPENSSL11_CFLAGS)#" $(@D)/Makefile
	$(SED) "s# build_tests##" $(@D)/Makefile
endef

# libdl is not available in a static build, and this is not implied by no-dso
ifeq ($(BR2_STATIC_LIBS),y)
define LIBOPENSSL11_FIXUP_STATIC_MAKEFILE
	$(SED) 's#-ldl##g' $(@D)/Makefile
endef
LIBOPENSSL11_POST_CONFIGURE_HOOKS += LIBOPENSSL11_FIXUP_STATIC_MAKEFILE
endif

define HOST_LIBOPENSSL11_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LIBOPENSSL11_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LIBOPENSSL11_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
endef

define HOST_LIBOPENSSL11_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
endef

define LIBOPENSSL11_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
	rm -rf $(TARGET_DIR)/usr/lib/ssl
	rm -f $(TARGET_DIR)/usr/bin/c_rehash
endef

# libdl has no business in a static build
ifeq ($(BR2_STATIC_LIBS),y)
define LIBOPENSSL11_FIXUP_STATIC_PKGCONFIG
	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
endef
LIBOPENSSL11_POST_INSTALL_STAGING_HOOKS += LIBOPENSSL11_FIXUP_STATIC_PKGCONFIG
endif

ifeq ($(BR2_PACKAGE_PERL),)
define LIBOPENSSL11_REMOVE_PERL_SCRIPTS
	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
endef
LIBOPENSSL11_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL11_REMOVE_PERL_SCRIPTS
endif

ifeq ($(BR2_PACKAGE_LIBOPENSSL11_BIN),)
define LIBOPENSSL11_REMOVE_BIN
	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
endef
LIBOPENSSL11_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL11_REMOVE_BIN
endif

ifneq ($(BR2_PACKAGE_LIBOPENSSL11_ENGINES),y)
define LIBOPENSSL11_REMOVE_LIBOPENSSL11_ENGINES
	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
endef
LIBOPENSSL11_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL11_REMOVE_LIBOPENSSL_ENGINES
endif

$(eval $(generic-package))
$(eval $(host-generic-package))
