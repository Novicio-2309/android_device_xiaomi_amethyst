# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := volcano
TARGET_NO_BOOTLOADER := true

# Boot Animation
TARGET_BOOTANIMATION_HALF_RES := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := volcano
TARGET_BOARD_PLATFORM_GPU := qcom-adreno

# Kernel - Prebuilt
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilts/kernel
BOARD_PREBUILT_DTBOIMAGE := $(LOCAL_PATH)/prebuilts/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true

# Kernel Headers
TARGET_KERNEL_VERSION := 6.1
TARGET_KERNEL_HEADERS := device/xiaomi/amethyst/kernel-headers

# Kernel Specs (Based on your Unpack Log)
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_RAMDISK_OFFSET       := 0x01000000
BOARD_DTB_OFFSET           := 0x01f00000

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(LOCAL_PATH)/prebuilts/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := \
    $(LOCAL_PATH)/prebuilts/modules/msm_geni_serial.ko \
    $(LOCAL_PATH)/prebuilts/modules/qcom_geni_se.ko

# GKI / Android 16 Requirements
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_BINARIES := kernel

# Graphics
BOARD_USES_ADRENO := true
TARGET_USES_ION := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true

# Display
TARGET_SCREEN_DENSITY := 440
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_COLOR_METADATA := true

# Partitions (Base sa fstab na inextract natin)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_USES_METADATA_PARTITION := true

# Dynamic Partitions
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9126805504
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vendor_dlkm \
    system_dlkm

# File System Types (EROFS as seen in fstab)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

# A/B (Virtual A/B with Compression)
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    init_boot \
    dtbo \
    vendor_boot \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vendor_dlkm \
    system_dlkm \
    vbmeta \
    vbmeta_system

BOARD_USES_RECOVERY_AS_BOOT := false

# Verified Boot (AVB)
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Metadata Encryption (Base sa fstab: aes-256-xts)
BOARD_USES_METADATA_PARTITION := true

# Recovery / Fastbootd
TARGET_RECOVERY_FSTAB := device/xiaomi/amethyst/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Thermal
TARGET_USES_THERMAL_SERVICE := true

# VINTF (Vendor Interface)
DEVICE_MANIFEST_FILE := device/xiaomi/amethyst/manifest.xml
DEVICE_MANIFEST_FILE += $(wildcard vendor/xiaomi/amethyst/proprietary/etc/vintf/manifest/*.xml)

DEVICE_MATRIX_FILE := device/xiaomi/amethyst/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := vendor/lineage/config/device_framework_matrix.xml

PRODUCT_SOONG_NAMESPACES += \
    vendor/xiaomi/amethyst

# Properties
TARGET_SYSTEM_PROP += device/xiaomi/amethyst/system.prop
TARGET_VENDOR_PROP += device/xiaomi/amethyst/vendor.prop

include vendor/xiaomi/amethyst/BoardConfigVendor.mk
