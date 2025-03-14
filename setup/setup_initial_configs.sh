#!/bin/bash

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to copy a file with feedback
copy_file() {
    local src="$1"
    local dest="$2"

    # Check if the destination is a file and remove it if necessary
    if [ -f "$dest" ]; then
        echo "Error: A file already exists at the destination ($dest), but a directory is expected."
        echo "Attempting to remove the conflicting file..."
        rm -f "$dest"  # Be cautious! This deletes the file permanently
    fi

    mkdir -p "$(dirname "$dest")"
    cp -f "$src" "$dest" && echo "Copied: $src to $dest"
}

# Files to copy
files=(
    "$SCRIPT_DIR/initial_config/.config/hypr/workspaces.conf:$HOME/.config/hypr/"
    "$SCRIPT_DIR/initial_config/.config/hypr/monitors.conf:$HOME/.config/hypr/"
    "$SCRIPT_DIR/initial_config/.config/hypr/conf/colors-hyprland.conf:$HOME/dotfiles/links/.config/hypr/conf/"
    "$SCRIPT_DIR/initial_config/.config/swaync/colors-swaync.css:$HOME/dotfiles/links/.config/swaync/"
    "$SCRIPT_DIR/initial_config/.config/tofi/config:$HOME/dotfiles/links/.config/tofi/config"
    "$SCRIPT_DIR/initial_config/.config/waybar/colors-waybar.css:$HOME/dotfiles/links/.config/waybar/"
    "$SCRIPT_DIR/initial_config/.config/waypaper/config.ini:$HOME/dotfiles/links/.config/waypaper/"
    "$SCRIPT_DIR/initial_config/.config/wlogout/colors-wlogout.css:$HOME/dotfiles/links/.config/wlogout/"
    "$SCRIPT_DIR/initial_config/.config/rofi/themes/colors-rofi.rasi:$HOME/dotfiles/links/.config/rofi/themes/colors-rofi.rasi"
)

echo "Setting up initial configurations..."
# Copy each file
for file in "${files[@]}"; do
    IFS=":" read -r src dest <<< "$file"
    copy_file "$src" "$dest"
done

# Copy wallpapers folder
echo "Copying wallpapers..."
cp -rf "$SCRIPT_DIR/initial_config/Wallpapers/" "$HOME"
echo "Copied wallpapers to $HOME/Wallpapers/"

ln -s "$HOME/Wallpapers/default.png" "$HOME/Wallpapers/.current"
echo "Setup complete."

