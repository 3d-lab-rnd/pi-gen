#!/bin/bash -e
# Install Docker using official get.docker.com script

curl -fsSL https://get.docker.com | sh

# Add first user to docker group
usermod -aG docker "${FIRST_USER_NAME}"
