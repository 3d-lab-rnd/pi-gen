#!/bin/bash -e
# Append random suffix to hostname for unique device identification

# Generate random suffix for hostname (4 chars: uppercase + digits)
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'A-Z0-9' | fold -w 4 | head -n 1)
CURRENT_HOSTNAME=$(cat /etc/hostname)
NEW_HOSTNAME="${CURRENT_HOSTNAME}-new-${RANDOM_SUFFIX}"

echo "$NEW_HOSTNAME" > /etc/hostname
sed -i "s/${CURRENT_HOSTNAME}/${NEW_HOSTNAME}/g" /etc/hosts

echo "Hostname set to: $NEW_HOSTNAME"
