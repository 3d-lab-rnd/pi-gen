#!/bin/bash -e
# Initialize NG netplan directory for split network config scripts

mkdir -p "${ROOTFS_DIR}/etc/netplan"

log "Initialized NG netplan directory at ${ROOTFS_DIR}/etc/netplan"

