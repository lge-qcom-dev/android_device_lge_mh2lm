#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/hw/fingerprint.msmnile.so)
            "${PATCHELF}" --add-needed "libRbsFlow_shim.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=mh2lm
export DEVICE_COMMON=sm8150-common
export VENDOR=lge

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
