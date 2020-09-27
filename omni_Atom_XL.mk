$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Add this line if your device is 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# Otherwise, If you have 32-bit device, add the below line instead of above line
# $(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Another common config inclusion
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)

# If you are building from OmniROM's minimal source, Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/Unihertz/Atom_XL/Atom_XL-vendor.mk)

# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += device/Unihertz/Atom_XL/prebuilt/Image.gz:kernel
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

PRODUCT_DEVICE := Atom_XL
PRODUCT_NAME := omni_Atom_XL
PRODUCT_BRAND := Unihertz
PRODUCT_MODEL := Atom_XL
PRODUCT_MANUFACTURER := Unihertz

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="Unihertz/Atom_XL_EEA/Atom_XL:10/QP1A.190711.020/root.20200312.183343:user/release-keys" \
    PRIVATE_BUILD_DESC="Atom_XL_EEA-user 10 QP1A.190711.020 root.20200312.183343 release-keys"
