################################################################################
#
# libcedarc
#
################################################################################
LIBCEDARC_VERSION = master
LIBCEDARC_SITE = $(call github,aodzip,libcedarc,$(LIBCEDARC_VERSION))
LIBCEDARC_DEPENDENCIES = 
LIBCEDARC_INSTALL_STAGING = YES
LIBCEDARC_INSTALL_TARGET = YES
LIBCEDARC_AUTORECONF = YES
LIBCEDARC_CONF_OPTS = 
LIBCEDARC_CONF_ENV = \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) -L$(@D)/library/arm-linux-gnueabihf"

$(eval $(autotools-package))
