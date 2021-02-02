#!/bin/bash

# Check if script run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
else

# Install Docker and add permission for user pi
curl -sSL https://get.docker.com | sh
usermod -aG docker pi

# Installing proper dependencies
apt-get install -y libffi-dev libssl-dev
apt-get install -y python python-pip python3 python3-pip
apt-get remove -y python-configparser

# Installing Docker Compose
pip3 install docker-compose


# Installing third party dependencies
apt-get install -y vim git

fi
