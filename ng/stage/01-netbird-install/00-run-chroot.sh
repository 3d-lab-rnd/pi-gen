#!/bin/bash -e
# Install NetBird client in the image

curl -fsSL https://pkgs.netbird.io/install.sh | sh
netbird service stop || true

# Remove any state/keys generated during install so each device gets a unique
# WireGuard identity on first boot instead of sharing the baked-in image key.
rm -rf /var/lib/netbird/*

echo "NetBird installed successfully"
