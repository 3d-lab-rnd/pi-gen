#!/bin/bash -e
# ng-common-pre stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
