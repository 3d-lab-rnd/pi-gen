#!/bin/bash -e
# ng-common-post stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
