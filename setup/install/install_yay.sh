#!/bin/bash

echo "Installing yay..."
# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "git is not installed. Installing git..."
    sudo pacman -Sy --noconfirm git
fi

# sudo pacman -Syu --noconfirm || echo "Error: Failedf to synchronize pacman"  # Update package database

# Clone yay repository from AUR
git clone --quiet https://aur.archlinux.org/yay.git || echo "Error: Failed to clone yay via git"

# Change directory to yay and handle failure
cd yay || { echo "Failed to change directory to yay"; exit 1; }

# Build and install yay using makepkg
makepkg -si --noconfirm || echo "Error: Failed to install yay"

# Clean up (optional)
cd ..
rm -rf yay

if command -v yay &> /dev/null; then
    echo "Yay has been installed successfully."
else
    echo "Error: Failed to install yay"
fi
