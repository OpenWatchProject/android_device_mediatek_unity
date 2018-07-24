# Release name
PRODUCT_RELEASE_NAME := unity

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/mediatek/unity/device.mk)

# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 320

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_unity
PRODUCT_DEVICE := unity
PRODUCT_BRAND := mediatek
PRODUCT_MANUFACTURER := mediatek
PRODUCT_MODEL := unity