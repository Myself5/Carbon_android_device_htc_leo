# Pull all dictionaries (This makes sure it gets called)
TARGET_USE_KEYBOARD := international

# Inherit common product files.
$(call inherit-product, vendor/carbon/config/common_phone.mk)

# Inherit AOSP device configuration for leo.
$(call inherit-product, device/htc/leo/device_leo.mk)

# Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

# Device identifier. This must come after all inclusions
PRODUCT_MODEL := HTC HD2
PRODUCT_MANUFACTURER := HTC
PRODUCT_BRAND := htc
PRODUCT_DEVICE := leo
PRODUCT_NAME := carbon_leo
