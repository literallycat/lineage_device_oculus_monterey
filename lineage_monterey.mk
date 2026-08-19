#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from monterey device
$(call inherit-product, device/oculus/monterey/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := monterey
PRODUCT_NAME := lineage_monterey
PRODUCT_BRAND := oculus
PRODUCT_MODEL := Quest
PRODUCT_MANUFACTURER := oculus

PRODUCT_GMS_CLIENTID_BASE := android-oculus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="vr_monterey-user 10 QQ3A.200805.001 49845030443200410 release-keys" \
    BuildFingerprint=oculus/vr_monterey/monterey:10/QQ3A.200805.001/49845030443200410:user/release-keys
