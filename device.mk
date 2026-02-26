# Rootdir (FSTAB)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# Shipping API level (Android 14 = 34)
PRODUCT_SHIPPING_API_LEVEL := 34

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

# Soong Config (Qualcomm Volcano)
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/amethyst
