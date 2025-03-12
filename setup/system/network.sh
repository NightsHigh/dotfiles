#!/bin/bash

# Find the first non-loopback network interface
NETWORK_INTERFACE=$(ip link | awk -F: '/^[0-9]+: [^lo]/ {print $2}' | tr -d ' ' | head -n 1)

if [ -z "$NETWORK_INTERFACE" ]; then
    echo "No network interface found. Exiting."
    exit 1
fi

echo "Found network interface: $NETWORK_INTERFACE"

# Enable dhcpcd service for the network interface
echo "Enabling dhcpcd service for $NETWORK_INTERFACE..."
sudo systemctl enable "dhcpcd@$NETWORK_INTERFACE.service"

# Start the dhcpcd service
echo "Starting dhcpcd service for $NETWORK_INTERFACE..."
sudo systemctl start "dhcpcd@$NETWORK_INTERFACE.service"

# Verify the connection
echo "Verifying connection..."
if ip addr show "$NETWORK_INTERFACE" | grep -q "inet"; then
    echo "$NETWORK_INTERFACE is up and has an IP address."
else
    echo "Failed to obtain an IP address for $NETWORK_INTERFACE."
    exit 1
fi

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

echo "dhcpcd and NetworkManager configuration complete for $NETWORK_INTERFACE!"
