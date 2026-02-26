# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from LineageOS common product configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from amethyst device configuration
$(call inherit-product, device/xiaomi/amethyst/device.mk)

# Device identifier
PRODUCT_NAME := lineage_amethyst
PRODUCT_DEVICE := amethyst
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 14 Pro+ 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Build Fingerprint (Galing sa build.prop na inextract natin)
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="amethyst" \
    PRODUCT_NAME="amethyst_global" \
    PRIVATE_BUILD_DESC="amethyst_global-user 14 UKQ1.240624.001 OS3.0.3.0.WOPMIXM release-keys"

BUILD_FINGERPRINT := Redmi/amethyst_global/amethyst:14/UKQ1.240624.001/OS3.0.3.0.WOPMIXM:user/release-keys
