# Pull all dictionaries (This makes sure it gets called)
TARGET_USE_KEYBOARD := international

# Inherit common product files.
$(call inherit-product, vendor/carbon/config/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/carbon/config/gsm.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/carbon/config/common_full_phone.mk)

# Inherit AOSP device configuration for leo.
$(call inherit-product, device/htc/leo/device_leo.mk)

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

# Device identifier. This must come after all inclusions
PRODUCT_MODEL := HTC HD2
PRODUCT_MANUFACTURER := HTC
PRODUCT_BRAND := htc
PRODUCT_DEVICE := leo
PRODUCT_NAME := liquid_leo

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/carbon/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip
