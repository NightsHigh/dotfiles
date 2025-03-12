#!/bin/bash

# Define systemd-boot entry directory
LOADER_ENTRIES_DIR="/boot/loader/entries"
SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

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

# Ensure pacman hooks directory exists
HOOKS_DIR="/etc/pacman.d/hooks"
if [ ! -d "$HOOKS_DIR" ]; then
    sudo mkdir -p "$HOOKS_DIR"
fi

# Copy the pacman hook file if it exists
HOOK_FILE="$SCRIPT_DIR/nvidia/nvidia.hook"
if [ -f "$HOOK_FILE" ]; then
    sudo cp "$HOOK_FILE" "$HOOKS_DIR/nvidia.hook"
    echo "Pacman hook installed successfully."
else
    echo "Warning: nvidia.hook file not found at $HOOK_FILE. Skipping."
fi

echo "NVIDIA boot configuration updated successfully!"
