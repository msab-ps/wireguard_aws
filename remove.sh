#!/bin/bash

echo "# Removing"

wg-quick down wg0
systemctl stop wg-quick@wg0
systemctl disable wg-quick@wg0

if [ -n "$(command -v yum)" ]
then
    yum remove -y wireguard-dkms wireguard-tools
    yum update -y
elif [ -n "$(command -v apt-get)" ]
then
    yes | apt autoremove wireguard wireguard-dkms wireguard-tools
    yes | apt update
fi

rm -rf /etc/wireguard

echo "# Removed"
