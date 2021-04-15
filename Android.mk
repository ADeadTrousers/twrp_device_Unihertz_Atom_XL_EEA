ifneq ($(filter Atom_XL_EEA ,$(TARGET_DEVICE)),)

LOCAL_PATH := device/Unihertz/Atom_LXL

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
