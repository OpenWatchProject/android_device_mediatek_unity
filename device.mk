$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/mediatek/unity/unity-vendor.mk)

PRODUCT_CHARACTERISTICS := default

LOCAL_PATH := device/mediatek/unity
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# PERMISSIONS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    $(LOCAL_PATH)/rootdir/system/etc/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# AGPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Telecom
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/rootdir/system/etc/ecc_list.xml:system/etc/ecc_list.xml \
    $(LOCAL_PATH)/rootdir/system/etc/spn-conf.xml:system/etc/spn-conf.xml \
    
# Audio	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/rootdir/system/etc/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
    $(LOCAL_PATH)/rootdir/system/etc/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/rootdir/system/etc/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/rootdir/system/etc/tp/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/rootdir/system/etc/tp/thermal.off.conf:system/etc/.tp/thermal.off.conf
	
# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \


# RAMDISK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/root//sbin/busybox:root/sbin/busybox \
    $(LOCAL_PATH)/rootdir/root/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/rootdir/root/fstab.mt6580:root/fstab.mt6580 \
    $(LOCAL_PATH)/rootdir/root/init.recovery.mt6580.rc:root/init.recovery.mt6580.rc \
    $(LOCAL_PATH)/rootdir/root/init.mt6580.rc:root/init.mt6580.rc \
    $(LOCAL_PATH)/rootdir/root/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/rootdir/root/init.ssd.rc:root/init.ssd.rc \
    $(LOCAL_PATH)/rootdir/root/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/root/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/rootdir/root/init.mt6580.usb.rc:root/init.mt6580.usb.rc \
    $(LOCAL_PATH)/rootdir/root/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/root/init.nvdata.rc:root/init.nvdata.rc \
    $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS += device/mediatek/unity/overlay

PRODUCT_PACKAGES += \
    libxlog
    
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libdashplayer

PRODUCT_PACKAGES += \
   	libgralloc_extra

# hack to fix asec on emulated sdcard
PRODUCT_PACKAGES += \
    asec_helper

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    ro.zygote=zygote32 \
    persist.sys.usb.config=mtp

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# If you have 2GB RAM version, please use the 2048 dalvik-heap to fix wrong ram info after compile

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
