
# Inherit from common AOSP/Lineage configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from LineageOS common product
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from the hardware-specific device.mk (Display, audio, etc.)
$(call inherit-product, device/xiaomi/amethyst/device.mk)

# Inherit from the proprietary vendor blobs
$(call inherit-product, vendor/xiaomi/amethyst/amethyst-vendor.mk)

# Device identifier
PRODUCT_NAME := lineage_amethyst
PRODUCT_DEVICE := amethyst
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 24115RA8EG
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Build Properties & Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="amethyst" \
    PRODUCT_NAME="amethyst"

BUILD_FINGERPRINT := Redmi/amethyst/amethyst:14/BP2A.250605.031.A3/OS3.0.3.0.WOPCNXM:user/release-keys

# Rootdir - Init scripts & FSTAB
PRODUCT_COPY_FILES += \
    device/xiaomi/amethyst/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

# VINTF Manifests
DEVICE_MANIFEST_FILE += device/xiaomi/amethyst/vintf/manifest.xml
DEVICE_MATRIX_FILE += device/xiaomi/amethyst/vintf/compatibility_matrix.xml
