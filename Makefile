ARCHS = arm64
TARGET = iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NewDevice
NewDevice_FILES = Tweak.xm
NewDevice_CFLAGS = -fobjc-arc
NewDevice_FRAMEWORKS = UIKit Foundation

# 添加这行绕过签名错误
NewDevice_NO_THEOS_LEAN_AND_MEAN = 1

include $(THEOS_MAKE_PATH)/tweak.mk

# 添加后处理步骤
after-stage::
	@echo "Build completed successfully!"
