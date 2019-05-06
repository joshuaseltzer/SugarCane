TARGET=iphone:clang:11.2:11.0
ARCHS=arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SugarCane
SugarCane_FILES = Tweak.xm

THEOS_PACKAGE_BASE_VERSION = 1.0.1
_THEOS_INTERNAL_PACKAGE_VERSION = 1.0.1

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
