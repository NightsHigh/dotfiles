#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if the script is being run as root
if [ "$(id -u)" -eq 0 ]; then
    echo "This script should not be run as root."
    exit 1
fi

sudo -v

if ! sudo -v; then
    echo "Sudo authentication failed. Exiting..."
    exit 1
fi

# Refresh sudo timestamp periodically to prevent timeout
(sudo -v; while true; do sleep 60; sudo -v; done) &
SUDO_PID=$!

# Function to install development tools
install_dev_tools() {
    echo "Installing development tools (gcc, make, etc.)..."
    bash "$SCRIPT_DIR/setup/development.sh"
}

# Function to prepare for gaming
install_gaming_tools() {
    echo "Installing gaming-related packages (steam, drivers, etc.)..."
    bash "$SCRIPT_DIR/setup/gaming.sh"

}

install_system() {
    echo "Finishing system configs"
    bash "$SCRIPT_DIR/setup/system.sh"
}

install_nvidia() {
    echo "Installing nvidia drivers"
    bash "$SCRIPT_DIR/setup/tools/install_packages.sh" pacman "$SCRIPT_DIR/setup/packages/nvidia_packages.txt"
    bash "$SCRIPT_DIR/setup/system/configure_nvidia.sh"
}

install_media_tools() {
    echo "Installing basic tools (VLC, Discord etc)"
    bash "$SCRIPT_DIR/setup/tools/install_packages.sh" pacman "$SCRIPT_DIR/setup/packages/basic_tools.txt"    
    bash "$SCRIPT_DIR/setup/applications/betterdiscord.sh"
}

# Function to ask a yes/no question and return the answer as a boolean
ask_boolean_question() {
    while true; do
        read -p "$1 (y/n): " answer
        case "$answer" in
            [Yy]* ) return 0;;  # Return 0 (true) for yes
            [Nn]* ) return 1;;  # Return 1 (false) for no
            * ) echo "Please answer with y (yes) or n (no).";;
        esac
    done
}

# Main script logic
echo "Welcome! Let's configure your system."

# Ask questions and store boolean responses directly
if ask_boolean_question "Do you have an nvidia graphics card?"; then nvidia_drivers=0; else dev_tools=1; fi
if ask_boolean_question "Do you want to install development tools?"; then dev_tools=0; else dev_tools=1; fi
if ask_boolean_question "Do you want to prepare your system for gaming?"; then gaming_tools=0; else gaming_tools=1; fi
if ask_boolean_question "Do you want to install media tools?"; then media_tools=0; else media_tools=1; fi

# Update system and install basic packages (needed for other scripts)
echo "Updating system and installing essential packages..."
sudo pacman -Syu --noconfirm > /dev/null 2>&1 || echo "Error: Failedf to synchronize pacman"  # Update package database
bash "$SCRIPT_DIR/setup/tools/install_packages.sh" pacman git wget curl zip unzip rustup
bash "$SCRIPT_DIR/setup/install/install_yay.sh"

# Ensure Rust is properly set up

echo "Setting up Rust toolchains..."
rustup install stable > /dev/null 2>&1 || echo "Error: Failed to install stable toolchain."
rustup install nightly > /dev/null 2>&1 || echo "Error: Failed to install stable toolchain"

# Conditionally install based on the user's responses

if [ "$nvidia_drivers" -eq 0 ]; then
    install_nvidia
fi

install_system

if [ "$dev_tools" -eq 0 ]; then
    install_dev_tools
fi

if [ "$gaming_tools" -eq 0 ]; then
    install_gaming_tools
fi

if [ "$media_tools" -eq 0 ]; then
    install_media_tools
fi


bash "$SCRIPT_DIR/setup/setup_initial_configs.sh"
bash "$SCRIPT_DIR/setup/tools/clean_dotfiles.sh"
bash "$SCRIPT_DIR/setup/tools/link_dotfiles.sh"



echo "All done! Your system is now configured."

# Stop the sudo refresh process
kill $SUDO_PID

