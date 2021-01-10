#!/bin/bash

# Check if script run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
else

# Change pi passwd
sudo -u pi passwd

# Add all public keys to authorized keys (executing as pi user)
sudo -u pi mkdir -p /home/pi/.ssh
for file in env/ssh_keys/*; do
  sudo -u pi cat $file >> /home/pi/.ssh/authorized_keys
done

# Only allow pub key SSH authentication
echo "
PasswordAuthentication no
PubkeyAuthentication yes" >> /etc/ssh/sshd_config
service ssh restart

fi
