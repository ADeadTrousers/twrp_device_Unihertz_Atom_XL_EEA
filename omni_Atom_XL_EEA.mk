PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from common device
#$(call inherit-product, device/Unihertz/Atom_LXL/deviceCommon.mk)

# Another common config inclusion
#$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)

# If you are building from OmniROM's minimal source, Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)

# Files under $(LOCAL_PATH)/recovery/root/ get automatically copied into recovery
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/Unihertz/Atom_LXL/recovery/root,root)

PRODUCT_NAME := omni_Atom_XL_EEA
PRODUCT_DEVICE := Atom_XL_EEA
PRODUCT_BRAND := Unihertz
PRODUCT_MODEL := Atom_XL
PRODUCT_MANUFACTURER := Unihertz

PRODUCT_BOARD := g63v71c2k_dfl_seea

# Add fingerprint from Stock ROM build.prop
BUILD_FINGERPRINT := "Unihertz/Atom_XL_EEA/Atom_XL:10/QP1A.190711.020/root.20200923.160250:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=Atom_XL_EEA \
    PRODUCT_NAME=Atom_XL_EEA \
    PRIVATE_BUILD_DESC="Atom_XL_EEA-user 10 QP1A.190711.020 root.20200923.160250 release-keys"