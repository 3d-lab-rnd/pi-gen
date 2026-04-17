#!/bin/bash -e
# Write eth0 netplan configuration when enabled

NETPLAN_FILE="${ROOTFS_DIR}/etc/netplan/10_ng-eth0.yaml"

if [ "${NG_ENABLE_ETH_DHCP}" != "1" ] && [ "${NG_ENABLE_ETH_MANUAL}" != "1" ]; then
	log "Ethernet disabled, skipping eth0 netplan configuration"
	rm -f "${NETPLAN_FILE}"
	exit 0
fi

log "Configuring Ethernet"
cat > "${NETPLAN_FILE}" << 'EOF'
network:
  version: 2
  renderer: networkd
  ethernets:
EOF

if [ "${NG_ENABLE_ETH_DHCP}" = "1" ]; then
	cat >> "${NETPLAN_FILE}" << 'EOF'
    eth0:
      dhcp4: true
      dhcp6: true
      optional: true
EOF
elif [ "${NG_ENABLE_ETH_MANUAL}" = "1" ]; then
	if [ -z "${NG_ETH_IP}" ] || [ -z "${NG_ETH_GATEWAY}" ] || [ -z "${NG_ETH_DNS}" ]; then
		log "ERROR: Static ethernet enabled but missing required config (IP/CIDR, GATEWAY, DNS)"
		exit 1
	fi

	cat >> "${NETPLAN_FILE}" << EOF
    eth0:
      dhcp4: false
      addresses:
        - ${NG_ETH_IP}
      routes:
        - to: default
          via: ${NG_ETH_GATEWAY}
      nameservers:
        addresses:
          - ${NG_ETH_DNS}
EOF
fi

chmod 600 "${NETPLAN_FILE}"