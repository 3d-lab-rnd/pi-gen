#!/bin/bash -e
# Configure default WiFi connections

# Create NetworkManager connection directory
mkdir -p "${ROOTFS_DIR}/etc/NetworkManager/system-connections"

# 3DLab WiFi (priority 100)
cat > "${ROOTFS_DIR}/etc/NetworkManager/system-connections/3DLab.nmconnection" << 'EOF'
[connection]
id=3DLab
type=wifi
autoconnect=true
autoconnect-priority=100

[wifi]
mode=infrastructure
ssid=3DLab

[wifi-security]
key-mgmt=wpa-psk
psk=3dlab%6734_farb

[ipv4]
method=auto

[ipv6]
method=auto
EOF

# kszonogrod WiFi (priority 90)
cat > "${ROOTFS_DIR}/etc/NetworkManager/system-connections/kszonogrod.nmconnection" << 'EOF'
[connection]
id=kszonogrod
type=wifi
autoconnect=true
autoconnect-priority=90

[wifi]
mode=infrastructure
ssid=kszonogrod

[wifi-security]
key-mgmt=wpa-psk
psk=algorytm

[ipv4]
method=auto

[ipv6]
method=auto
EOF

# Set proper permissions (required by NetworkManager)
chmod 600 "${ROOTFS_DIR}/etc/NetworkManager/system-connections/3DLab.nmconnection"
chmod 600 "${ROOTFS_DIR}/etc/NetworkManager/system-connections/kszonogrod.nmconnection"
