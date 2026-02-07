#!/bin/bash -e
# ng-3dlab-wifi stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
