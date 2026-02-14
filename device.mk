DEVICE_PATH := device/xiaomi/amethyst

# Display / Graphic
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 440dpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi

# Graphics / Vulkan
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    android.hardware.graphics.mapper-impl-qti-display

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth \
    vendor.qti.hardware.bluetooth.audio

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_PACKAGES += \
    android.hardware.audio.service_64 \
    audio.primary.volcano \
    audio.r_submix.default \
    audio.usb.default

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal \
    android.hardware.sensors-service-multihal.rc

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.qti \
    vendor.qti.hardware.power.powermodule

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.qti

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.default \
    vendor.hardware.vibratorfeature.IVibratorExt-service

# A/B Support & Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
AB_OTA_UPDATER := true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    update_engine \
    update_verifier \
    update_engine_sideload

# Rootdir - Init scripts & FSTAB
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    firmware_symlinks

# Dalvik heap config (Para sa 12GB RAM)
$(call inherit-product, frameworks/native/build/phone-xhdpi-12288-dalvik-heap.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# VINTF Manifests

# I-include na rin natin ang ibang manifest kung mayroon na
DEVICE_MANIFEST_FILE += $(wildcard $(DEVICE_PATH)/vintf/*.xml)

# Inherit from the proprietary vendor setup
$(call inherit-product, vendor/xiaomi/amethyst/amethyst-vendor.mk)

# Comprehensive Audio Configuration (All SKUs)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.xml,$(LOCAL_PATH)/audio,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(call find-copy-subdir-files,*.conf,$(LOCAL_PATH)/audio,$(TARGET_COPY_OUT_VENDOR)/etc)
