LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),amethyst)

include $(call all-makefiles-under,$(LOCAL_PATH))

# Create Firmware Symlinks
include $(CLEAR_VARS)
LOCAL_MODULE := firmware_symlinks
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_POST_INSTALL_CMD := \
    mkdir -p $(TARGET_OUT_VENDOR)/firmware; \
    ln -sf /vendor/firmware_mnt/image/adsp.mdt $(TARGET_OUT_VENDOR)/firmware/adsp.mdt; \
    ln -sf /vendor/firmware_mnt/image/adsp.b00 $(TARGET_OUT_VENDOR)/firmware/adsp.b00

include $(BUILD_PHONY_PACKAGE)

endif
