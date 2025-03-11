#!/bin/bash

# Define systemd-boot entry directory
LOADER_ENTRIES_DIR="/boot/loader/entries"

# Check if NVIDIA drivers are installed
if ! lsmod | grep -q nvidia; then
    echo "NVIDIA drivers not detected. Exiting."
    exit 1
fi

echo "NVIDIA drivers detected. Configuring systemd-boot settings..."

# Append `nvidia-drm.modeset=1` to each systemd-boot entry
for entry in "$LOADER_ENTRIES_DIR"/*.conf; do
    if [ -f "$entry" ]; then
        if ! grep -q "nvidia-drm.modeset=1" "$entry"; then
            echo "Updating $entry..."
            sudo sed -i '/^options /s/$/ nvidia-drm.modeset=1/' "$entry"
        else
            echo "$entry already contains nvidia-drm.modeset=1. Skipping..."
        fi
    fi
done

# Update mkinitcpio if necessary
if [ -f "/etc/mkinitcpio.conf" ]; then
    echo "Updating mkinitcpio configuration..."
    sudo sed -i 's/^MODULES=([^)]*/& nvidia nvidia_modeset nvidia_uvm nvidia_drm/' "/etc/mkinitcpio.conf"
    sudo mkinitcpio -P
fi

echo "NVIDIA boot configuration updated successfully!"
