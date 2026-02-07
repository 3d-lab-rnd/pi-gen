#!/bin/bash -e
# ng-docker stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
