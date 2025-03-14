#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/BetterDiscord"
INITIAL_CONFIG_DIR="$SCRIPT_DIR/../initial_config"

# Remove existing BetterDiscord config directory
rm -rf "$CONFIG_DIR"

# Create necessary directories
mkdir -p "$CONFIG_DIR/themes/" "$CONFIG_DIR/data/stable/"

# Install betterdiscordctl if it's not already installed
yay -S --noconfirm betterdiscordctl

# Uninstall and install BetterDiscord
betterdiscordctl uninstall
betterdiscordctl install

# Copy configuration files
cp -f "$INITIAL_CONFIG_DIR/.config/BetterDiscord/themes/pywal-discord-default.theme.css" "$CONFIG_DIR/themes/"
cp -f "$INITIAL_CONFIG_DIR/.config/BetterDiscord/data/stable/themes.json" "$CONFIG_DIR/data/stable/"

echo "BetterDiscord is installed, it will finish setup when it's launched"
notify-send -t 6000 "BetterDiscord installed launch steam!"

# Done, Discord will initialize BetterDiscord on its first run
