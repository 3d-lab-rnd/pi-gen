#!/bin/bash -e
# Write Wi-Fi netplan configuration when enabled

NETPLAN_FILE="${ROOTFS_DIR}/etc/netplan/11_ng-wifi.yaml"

if [ "${NG_ENABLE_WIFI}" != "1" ]; then
	log "Wi-Fi disabled, skipping Wi-Fi netplan configuration"
	rm -f "${NETPLAN_FILE}"
	exit 0
fi

log "Configuring Wi-Fi"
cat > "${NETPLAN_FILE}" << 'EOF'
network:
  version: 2
  renderer: networkd
  wifis:
    wlan0:
      dhcp4: true
      dhcp6: true
      optional: true
      access-points:
EOF

for ap in ${NG_WIFI_APS}; do
	ssid="${ap%%:*}"
	password="${ap#*:}"
	cat >> "${NETPLAN_FILE}" << EOF
        "${ssid}":
          password: "${password}"
EOF
done

chmod 600 "${NETPLAN_FILE}"
