# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# general 
  USE_CAMERA_STUB := true

  # TARGET_SPECIFIC_HEADER_PATH := device/htc/leo/include/

# Board/CPU
  TARGET_NO_BOOTLOADER := true
  BOARD_VENDOR := htc
  TARGET_BOOTLOADER_BOARD_NAME := htcleo
  TARGET_BOARD_PLATFORM := qsd8k
  TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
  TARGET_ARCH := arm
  TARGET_ARCH_VARIANT := armv7-a-neon
  TARGET_CPU_ABI := armeabi-v7a
  TARGET_CPU_ABI2 := armeabi
  TARGET_CPU_VARIANT := cortex-a8
  TARGET_ARCH_VARIANT_CPU := scorpion
  TARGET_ARCH_VARIANT_FPU := neon
  TARGET_ARCH_LOWMEM := true
  ARCH_ARM_HAVE_VFP := true

# Scorpion
    TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

# FPU compilation flags
    TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
    TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

# Kernel
  TARGET_KERNEL_SOURCE := kernel/htc/leo
  TARGET_KERNEL_CONFIG := htcleo_defconfig
  BOARD_KERNEL_CMDLINE := no_console_suspend=1 wire.search_count=5
  BOARD_KERNEL_BASE := 0x11800000
  BOARD_KERNEL_NEW_PPPOX := true

# Kernel Toolchain
  TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3/bin/arm-eabi-

# bootanimation
  TARGET_BOOTANIMATION_HALF_RES := true

# Bluetooth
  BOARD_HAVE_BLUETOOTH := true
  BOARD_HAVE_BLUETOOTH_BCM := true
  BOARD_BLUEDROID_VENDOR_CONF := device/htc/leo/bluetooth/vnd_qsd8k.txt
  BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/htc/leo/bluetooth/include

# Qcom
  # TARGET_USES_ION := true
  BOARD_USES_QCOM_HARDWARE := true
  COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
  COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
  TARGET_QCOM_DISPLAY_VARIANT := legacy
  TARGET_QCOM_MEDIA_VARIANT := legacy
  TARGET_QCOM_AUDIO_VARIANT := legacy
  BOARD_VENDOR_QCOM_AMSS_VERSION := 3200
  

# Hardware rendering
  BOARD_EGL_CFG := device/htc/leo/egl.cfg
  USE_OPENGL_RENDERER := true
  BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

# We only have 2 buffers
  TARGET_DISABLE_TRIPLE_BUFFERING := true
  BOARD_NEEDS_MEMORYHEAPPMEM := true
  BOARD_EGL_WORKAROUND_BUG_10194508 := true
  TARGET_NO_HW_VSYNC := true
  COMMON_GLOBAL_CFLAGS += -DTARGET_8x50 -DQCOM_NO_SECURE_PLAYBACK -DDONT_USE_FENCE_SYNC -DEGL_NEEDS_FNW
  BOARD_EGL_NEEDS_LEGACY_FB := true

#Fix slow boot
  TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
  BOARD_USES_HWCOMPOSER := true

#Screenshot fix
  TARGET_FORCE_SCREENSHOT_CPU_PATH := true
  BOARD_USE_MHEAP_SCREENSHOT := true

# Webkit
  TARGET_FORCE_CPU_UPLOAD := true
  ENABLE_WEBGL := true

# Camera
  COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Camcorder
  BOARD_USE_OLD_AVC_ENCODER := true
  BOARD_NO_BFRAMES := true

# Wifi bcmdhd config
  WIFI_BAND := 802_11_ABG
  WPA_SUPPLICANT_VERSION := VER_0_8_X
  BOARD_WPA_SUPPLICANT_DRIVER := NL80211
  BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
  BOARD_HOSTAPD_DRIVER := NL80211
  BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
  BOARD_WLAN_DEVICE := bcmdhd
  WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd.bin"
  WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"
  WIFI_DRIVER_FW_PATH_P2P := "/vendor/firmware/fw_bcmdhd_p2p.bin"
  WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
  WIFI_DRIVER_MODULE_NAME := bcmdhd
  WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"
  BOARD_LEGACY_NL80211_STA_EVENTS := true

# Audio
  BOARD_USES_GENERIC_AUDIO := false

# Compass/Accelerometer
  BOARD_VENDOR_USE_AKMD := akm8973

# GPS
  # to enable the GPS HAL
  BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := htcleo

# AMSS version to use for GPS
  BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# Pull all dictionaries
  TARGET_USE_KEYBOARD := international

# Use legacy touchscreen
 BOARD_USE_LEGACY_TOUCHSCREEN := true

# Ril
  BOARD_USES_LEGACY_RIL := true

# Hacks
  TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
  BOARD_USE_LEGACY_TRACKPAD := true

# Legacy 
  BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760 # 10M
  BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 # 10M
  BOARD_SYSTEMIMAGE_PARTITION_SIZE := 329145600 # 300M
  BOARD_USERDATAIMAGE_PARTITION_SIZE := 41943040 # 400M
  BOARD_FLASH_BLOCK_SIZE := 131072

# Fix set metadata on yaffs2 use old set permission
  SKIP_SET_METADATA := true

# Recovery
  TARGET_RECOVERY_FSTAB = device/htc/leo/ramdisk/fstab.htcleo
  RECOVERY_FSTAB_VERSION := 2

