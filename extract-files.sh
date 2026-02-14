#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=amethyst
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

# Palitan ang $HOME ng actual path ng Termux
HELPER="/data/data/com.termux/files/home/android/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to generating makefiles
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}"

# Force the script to look at the local root directory (/)
# Ituro natin sa root (/) dahil nandoon ang /vendor partition
extract "${MY_DIR}/proprietary-files.txt" "/" "${SECTION}"

/data/data/com.termux/files/usr/bin/bash "${MY_DIR}/setup-makefiles.sh"

