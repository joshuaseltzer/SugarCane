ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
TARGET=iphone:clang:16.5:15.0
else
TARGET=iphone:clang:14.5:12.0
endif
ARCHS=arm64 arm64e

PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SugarCane
SugarCane_FILES = Tweak.xm
SugarCane_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
