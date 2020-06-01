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
LIBCEDARC_CONF_ENV = \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) -L$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)"
LIBCEDARC_CONF_OPTS = 
$(eval $(autotools-package))

mkdir -p "$(TARGET_DIR)/usr/lib/"
cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libVE.so" "$(TARGET_DIR)/usr/lib/"
cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libvideoengine.so" "$(TARGET_DIR)/usr/lib/"

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_AVS),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawavs.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_H264),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawh264.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_H265),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawh265.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_MJPEG),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmjpeg.so" "$(TARGET_DIR)/usr/lib/"
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmjpegplus.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_MPEG2),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmpeg2.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_MPEG4),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmpeg4base.so" "$(TARGET_DIR)/usr/lib/"
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmpeg4dx.so" "$(TARGET_DIR)/usr/lib/"
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmpeg4h263.so" "$(TARGET_DIR)/usr/lib/"
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmpeg4normal.so" "$(TARGET_DIR)/usr/lib/"
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawmpeg4vp6.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_VP8),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawvp8.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_VP9),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawvp9Hw.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_DECODER_WMV3),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libawwmv3.so" "$(TARGET_DIR)/usr/lib/"
endif

ifeq ($(BR2_PACKAGE_LIBCEDARC_ENCODER),y)
	cp "$(@D)/library/$(BR2_PACKAGE_LIBCEDARC_ARCHLIB)/libvencoder.so" "$(TARGET_DIR)/usr/lib/"
endif

ifneq ($(BR2_PACKAGE_LIBCEDARC_OPENMAX),y)
	rm "$(TARGET_DIR)/usr/lib/libOmxCore.so"
	rm "$(TARGET_DIR)/usr/lib/libOmxVdec.so"
	rm "$(TARGET_DIR)/usr/lib/libOmxVenc.so"
endif
