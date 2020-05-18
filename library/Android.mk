LOCAL_PATH:= $(call my-dir)

include $(LOCAL_PATH)/../config.mk

MY_SDK="notdef"

ifeq ($(JB42_AND_NEWER), yes)
MY_SDK=ajb42
endif

ifeq ($(KITKAT_AND_NEWER), yes)
MY_SDK=akk44
endif

ifeq ($(LOLLIPOP_AND_NEWER), yes)
MY_SDK=alp50
endif

ifeq ($(MARSHMALLOW_AND_NEWER), yes)
MY_SDK=amm60
endif

ifeq ($(NOUGAT_AND_NEWER), yes)
MY_SDK=anou70
endif

ifeq ($(OREO_AND_NEWER), yes)
MY_SDK=aore80
endif

LIB_32=${MY_SDK}_32
$(warning "lib_32 is: ${LIB_32}")

ifeq ($(MY_SDK), "notdef")
$(warning $(TARGET_PRODUCT) config not found! Please check it!)
endif

EXT_LIBS := \
	libVE \
	libvencoder \
	libvideoengine \
	libawavs \
	libawh264 \
	libawh265 \
	libawh265soft \
	libawmjpeg \
	libawmjpegplus \
	libawmpeg2 \
	libawmpeg4base \
	libawmpeg4dx \
	libawmpeg4h263 \
	libawmpeg4normal \
	libawmpeg4vp6 \
	libawvp6soft \
	libawvp8 \
	libawvp9soft \
	libawwmv3 \
	libawwmv12soft \
	libawvp9Hw \

##############################################
####  define-external-lib arg:
####                         $1: lib name
####                         $2: 32/64 bit
define define-external-lib
include $$(CLEAR_VARS)
LOCAL_MODULE := $1
LOCAL_SRC_FILES := $(MY_SDK)_$2/$1.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MULTILIB := $2
include $(BUILD_PREBUILT)
endef

$(foreach lib, $(EXT_LIBS),\
    $(eval $(call define-external-lib,$(lib),32)))

ifeq ($(LOLLIPOP_AND_NEWER), yes)
$(foreach lib, $(EXT_LIBS),\
    $(eval $(call define-external-lib,$(lib),64)))
endif
