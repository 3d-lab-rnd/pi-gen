#!/bin/bash -e
# Configure first-boot NetBird registration when a setup key is provided

if [ -z "${NG_NETBIRD_SETUP_KEY}" ]; then
	echo "NG_NETBIRD_SETUP_KEY is empty, skipping NetBird registration service"
	exit 0
fi

cat > /etc/systemd/system/netbird-register.service << EOF
[Unit]
Description=Register NetBird on first boot
After=network-online.target netbird.service
Wants=network-online.target
Requires=netbird.service
ConditionPathExists=!/var/lib/netbird/.registered

[Service]
Type=oneshot
ExecStartPre=/bin/sleep 10
ExecStart=/usr/bin/netbird up --management-url https://wire.atomizer.online --setup-key ${NG_NETBIRD_SETUP_KEY}
ExecStartPost=/bin/mkdir -p /var/lib/netbird
ExecStartPost=/bin/touch /var/lib/netbird/.registered
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable netbird-register.service

echo "NetBird registration service configured"
