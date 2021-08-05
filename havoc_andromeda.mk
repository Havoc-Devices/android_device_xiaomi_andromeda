#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit some common Havoc stuff
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# GApps
ifeq ($(WITH_GAPPS),true)
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_SUPPORTS_PIXEL_WALLPAPER := true
endif

# Inherit from andromeda device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := havoc_andromeda
PRODUCT_DEVICE := andromeda
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi MIX 3 5G
PRODUCT_MANUFACTURER := Xiaomi

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := google/coral/coral:11/RQ3A.210805.001.A1/7474174:user/release-keys

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="coral-user 11 RQ3A.210805.001.A1 7474174 release-keys" \
    PRODUCT_NAME="andromeda" \
    TARGET_DEVICE="andromeda"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Official
export export
HAVOC_BUILD_TYPE=Official

PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.maintainer=Inkypen
