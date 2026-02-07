#!/bin/bash -e
# ng-chromium stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
