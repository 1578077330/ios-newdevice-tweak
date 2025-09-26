ARCHS = arm64
TARGET = iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NewDevice
NewDevice_FILES = Tweak.xm
NewDevice_CFLAGS = -fobjc-arc
NewDevice_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk