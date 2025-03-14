#!/bin/bash
set -e

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to copy a file with feedback
copy_file() {
    local src="$1"
    local dest="$2"
    mkdir -p "$(dirname "$dest")"
    cp -f "$src" "$dest" && echo "Copied: $src to $dest"
}

# Files to copy
files=(
    "$SCRIPT_DIR/initial_config/.config/hypr/workspaces.conf:$HOME/.config/hypr/"
    "$SCRIPT_DIR/initial_config/.config/hypr/monitors.conf:$HOME/.config/hypr/"
    "$SCRIPT_DIR/initial_config/.config/hypr/conf/colors-hyprland.conf:$HOME/.config/hypr/conf/"
    "$SCRIPT_DIR/initial_config/.config/swaync/colors-swaync.css:$HOME/.config/swaync/"
    "$SCRIPT_DIR/initial_config/.config/tofi/config:$HOME/.config/tofi/config"
    "$SCRIPT_DIR/initial_config/.config/waybar/colors-waybar.css:$HOME/.config/waybar/"
    "$SCRIPT_DIR/initial_config/.config/waypaper/config.ini:$HOME/.config/waypaper/"
    "$SCRIPT_DIR/initial_config/.config/wlogout/colors-wlogout.css:$HOME/.config/wlogout/"
    "$SCRIPT_DIR/initial_config/.config/BetterDiscord/themes/pywal-discord-default.theme.css:$HOME/.config/BetterDiscord/themes/"
    "$SCRIPT_DIR/initial_config/.config/BetterDiscord/data/stable/themes.json:$HOME/.config/BetterDiscord/data/stable/"
)

echo "Setting up initial configurations..."
# Copy each file
for file in "${files[@]}"; do
    IFS=":" read -r src dest <<< "$file"
    copy_file "$src" "$dest"
done

# Copy wallpapers folder
echo "Copying wallpapers..."
cp -rf "$SCRIPT_DIR/initial_config/Wallpapers/" "$HOME/Wallpapers/"
echo "Copied wallpapers to $HOME/Wallpapers/"

echo "Setup complete."

