# Prebuilt Hal fragments (Camera, Audio, Display)
DEVICE_MANIFEST_FILE += $(wildcard vendor/xiaomi/amethyst/proprietary/etc/vintf/manifest/*.xml)

# Audio configuration
PRODUCT_COPY_FILES += \
    $(wildcard vendor/xiaomi/amethyst/proprietary/vendor/etc/audio/*.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/) \
    $(wildcard vendor/xiaomi/amethyst/proprietary/vendor/etc/*.xml:$(TARGET_COPY_OUT_VENDOR)/etc/)

# Sensors & Sensors Config
PRODUCT_COPY_FILES += \
    vendor/xiaomi/amethyst/proprietary/vendor/etc/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Rootdir (FSTAB)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# Shipping API level (Android 14 = 34)
PRODUCT_SHIPPING_API_LEVEL := 34

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

# Overlays
PRODUCT_PACKAGES += \
    LineageFodOverlay

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Display Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 440dpi

# Soong Config (Qualcomm Volcano)
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/amethyst

# Power HAL (Thermal & Performance)
PRODUCT_PACKAGES += \
    android.hardware.power-service.pixel-libperfmgr \
    libperfmgr

# Inherit from the proprietary vendor setup
$(call inherit-product, vendor/xiaomi/amethyst/amethyst-vendor.mk)
