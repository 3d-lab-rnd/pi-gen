#!/bin/bash -e
# Install NetBird client using patched installation script
# The patch disables service start which fails in chroot

INSTALL_SCRIPT="/tmp/netbird-install.sh"

echo "Installing NetBird"
curl -fsSL https://pkgs.netbird.io/install.sh | sh

echo "Stopping NetBird service (don't want that in chroot)"
netbird service stop

echo "NetBird installed successfully"
