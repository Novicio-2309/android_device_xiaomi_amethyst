# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from LineageOS common product
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from amethyst device
$(call inherit-product, device/xiaomi/amethyst/device.mk)

# Device identifier
PRODUCT_NAME := lineage_amethyst
PRODUCT_DEVICE := amethyst
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 24115RA8EG
PRODUCT_MANUFACTURER := Xiaomi

# Build Fingerprint (Android 16 BP2A)
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=amethyst \
    PRODUCT_NAME=amethyst \
    PRIVATE_BUILD_DESC="missi-user 16 BP2A.250605.031.A3 OS3.0.3.0.WOPCNXM release-keys"

BUILD_FINGERPRINT := Redmi/amethyst/amethyst:16/BP2A.250605.031.A3/OS3.0.3.0.WOPCNXM:user/release-keys

