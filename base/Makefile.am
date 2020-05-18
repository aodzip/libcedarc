
include $(top_srcdir)/Makefile.inc

lib_LTLIBRARIES = libcdc_base.la

libcdc_base_la_SOURCES = CdcSysinfo.c \
			CdcMessageQueue.c \
			CdcIonUtil.c

libcdc_base_la_CFLAGS = $(CFLAGS_CDCG)
LOCAL_INCLUDE = -I./include \
				-I$(top_srcdir)/include \
				-I$(top_srcdir)/base/include

libcdc_base_la_CFLAGS += $(LOCAL_INCLUDE)

libcdc_base_la_LDFLAGS = $(LDFLAGS_CDCG)
LOCAL_LIB = -lpthread -lrt
libcdc_base_la_LDFLAGS += $(LOCAL_LIB)
