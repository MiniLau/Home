#!/bin/bash

# Download official pms-docker
git clone https://github.com/plexinc/pms-docker.git /tmp/pms-docker

# Install RPI compatible Dockerfile
cd /tmp/pms-docker && docker build -t plexinc/pms-docker:latest-rpi -f Dockerfile.armv7 .

# Delete temporary data and comeback to root folder
rm -rf /tmp/pms-docker && cd ~
