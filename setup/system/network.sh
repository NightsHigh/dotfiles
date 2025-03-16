#!/bin/bash
if ! command -v nmcli &> /dev/null; then
    echo "NetworkManager is not installed. Installing..."
    sudo pacman -S networkmanager --noconfirm
else
    echo "NetworkManager is already installed."
fi

# Enable and start NetworkManager
echo "Enabling and starting NetworkManager..."
sudo systemctl enable --now NetworkManager.service

# Verify if NetworkManager is running
echo "Verifying NetworkManager status..."
if systemctl is-active --quiet NetworkManager; then
    echo "NetworkManager is running."
else
    echo "NetworkManager failed to start."
    exit 1
fi

echo "NetworkManager configuration complete for $NETWORK_INTERFACE!"
