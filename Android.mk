# this is now the default FreeType build for Android
#
ifndef USE_FREETYPE
USE_FREETYPE := 2.4.2
endif

ifeq ($(USE_FREETYPE),2.4.2)
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# compile in ARM mode, since the glyph loader/renderer is a hotspot
# when loading complex pages in the browser
#
LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES:= \
	src/access_io.c \
	src/access_lpt.c \
	src/access_ppdev.c \
	src/conf.c \
	src/debug.c \
	src/default.c \
	src/delay.c \
	src/detect.c \
	src/deviceid.c \
	# for Python
	#src/ieee1284module.c \
	src/interface.c \
	src/ports.c \
	src/state.c

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/ \
	$(LOCAL_PATH)/include

LOCAL_CFLAGS += -W -Wall
#LOCAL_CFLAGS += -fPIC -DPIC
#LOCAL_CFLAGS += "-DDARWIN_NO_CARBON"
#LOCAL_CFLAGS += "-DFT2_BUILD_LIBRARY"

# the following is for testing only, and should not be used in final builds
# of the product
#LOCAL_CFLAGS += "-DTT_CONFIG_OPTION_BYTECODE_INTERPRETER"

LOCAL_CFLAGS += -O2

LOCAL_MODULE:= libieee1284

include $(BUILD_STATIC_LIBRARY)
endif
