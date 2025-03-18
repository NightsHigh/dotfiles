#!/bin/bash

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to copy a file with feedback
copy_file() {
    local src="$1"
    local dest="$2"

    # Check if the destination is a file and remove it if necessary
    if [ -f "$dest" ]; then
        echo "Warning: A file already exists at the destination ($dest), removing it."
        rm -f "$dest"  # Removes the file permanently
    fi

    # Ensure the destination directory exists before copying
    mkdir -p "$(dirname "$dest")"
    if cp -f "$src" "$dest"; then
        echo "Copied: $src to $dest"
    else
        echo "Error: Failed to copy $src to $dest"
    fi
}

# Files to copy
files=(
    "$SCRIPT_DIR/initial_config/.config/hypr/workspaces.conf:$HOME/.config/hypr/workspaces.conf"
    "$SCRIPT_DIR/initial_config/.config/hypr/monitors.conf:$HOME/.config/hypr/monitors.conf"
    "$SCRIPT_DIR/initial_config/.config/Vencord/settings/settings.json:$HOME/.config/Vencord/settings/settings.json"
)

echo "Setting up initial configurations..."

# Copy each file
for file in "${files[@]}"; do
    IFS=":" read -r src dest <<< "$file"
    if [ -f "$src" ]; then
        copy_file "$src" "$dest"
    else
        echo "Error: Source file $src does not exist."
    fi
done

# Copy wallpapers folder
echo "Copying wallpapers..."
if [ -d "$SCRIPT_DIR/initial_config/Wallpapers/" ]; then
    cp -rf "$SCRIPT_DIR/initial_config/Wallpapers/" "$HOME"
    echo "Copied wallpapers to $HOME/Wallpapers/"
else
    echo "Error: Wallpapers directory not found."
fi

# Ensure .current symlink is set correctly
if [ -e "$HOME/Wallpapers/.current" ]; then
    rm -f "$HOME/Wallpapers/.current"
fi
ln -s "$HOME/Wallpapers/default.png" "$HOME/Wallpapers/.current"

# Run wallust if available to generate themes
if command -v wallust >/dev/null 2>&1; then
    wallust run "$HOME/Wallpapers/default.png"
else
    echo "wallust command not found, skipping wallpaper setup."
fi

echo "Setup complete."

