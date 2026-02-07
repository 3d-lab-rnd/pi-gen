#!/bin/bash -e
# Set hostname to ng-cast

echo "ng-cast" > /etc/hostname
sed -i 's/127.0.1.1.*/127.0.1.1\tng-cast/' /etc/hosts
