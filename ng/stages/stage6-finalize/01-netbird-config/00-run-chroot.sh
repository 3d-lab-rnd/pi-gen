#!/bin/bash -e
# Configure NetBird first-boot registration service

# Create first-boot service to register NetBird with setup key
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
ExecStart=/usr/bin/netbird up --management-url https://wire.atomizer.online --setup-key NG_NETBIRD_SETUP_KEY_PLACEHOLDER
ExecStartPost=/bin/mkdir -p /var/lib/netbird
ExecStartPost=/bin/touch /var/lib/netbird/.registered
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# Replace placeholder with actual setup key
sed -i "s|NG_NETBIRD_SETUP_KEY_PLACEHOLDER|${NG_NETBIRD_SETUP_KEY}|g" /etc/systemd/system/netbird-register.service

# Enable the service
systemctl enable netbird-register.service

echo "NetBird registration service configured"
