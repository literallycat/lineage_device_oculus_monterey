#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oculus/monterey

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := monterey
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 235

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.configfs=true androidboot.hardware=monterey ehci-hcd.park=3 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 softdog.soft_panic=1 swiotlb=2048 user_debug=31 bootver=1596585601 cursysver=1596585601 minsysver=1 buildvariant=user veritykeyid=id:cc158dc3bf03e76f1e4f8e38b2841cb9f2d421e4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := monterey_defconfig
TARGET_KERNEL_SOURCE := kernel/oculus/monterey

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
endif

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 29855744

# Platform
TARGET_BOARD_PLATFORM := msm8998

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.monterey
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Inherit the proprietary files
include vendor/oculus/monterey/BoardConfigVendor.mk

# Experimental native controller tracking (off unless explicitly enabled).
ifeq ($(WITH_OPENQUEST_CONTROLLER_TRACKING),true)
include external/openquest/components/controller_tracking/lineage/BoardConfig.mk
endif
