#!/bin/bash -e
# Active NG stage prerun

if [ ! -d "${ROOTFS_DIR}" ]; then
    copy_previous
fi
