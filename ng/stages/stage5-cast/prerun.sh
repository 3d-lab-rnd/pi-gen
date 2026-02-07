#!/bin/bash -e
# ng-cast stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
