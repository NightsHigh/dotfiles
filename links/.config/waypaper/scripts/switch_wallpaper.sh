#!/bin/bash

# Set the WALLPAPER variable to the provided argument
WALLPAPER=$(basename "$1")


sleep 0.2


if [[ -n $WALLPAPER ]]; then

    # Generate colorscheme
    wpg -s "$WALLPAPER" 


    # kill waybar process
    killall waypaper
    killall waybar

    sleep 0.5


    # Apply colorscheme
    cp -f "$HOME/.cache/wal/colors-tofi.conf" "$HOME"/dotfiles/links/.config/tofi/config
    cp -f "$HOME/.cache/wal/colors-hyprland.conf" "$HOME/dotfiles/links/.config/hypr/conf/colors-hyprland.conf"
    cp -f "$HOME/.cache/wal/colors-waybar.css" "$HOME/dotfiles/links/.config/waybar/colors-waybar.css"
    cp -f "$HOME/.cache/wal/colors-swaync.css" "$HOME/dotfiles/links/.config/swaync/colors-swaync.css"
    cp -f "$HOME/.cache/wal/colors-wlogout.css" "$HOME/dotfiles/links/.config/wlogout/colors-wlogout.css"
    cp -f "$HOME/.cache/wal/colors-rofi.rasi" "$HOME/.config/rofi/themes/"
    pywal-discord -d "$WALLPAPER" &
    pywal-discord -t default &

    rm -rf "$HOME/Wallpapers/.current"
    cp "$HOME/.config/wpg/.current" "$HOME/Wallpapers/.current"


    # Start waybar again
    bash "$HOME/dotfiles/links/.config/waybar/launch-waybar.sh" &
    swaync-client -rs

    notify-send -t 6000 -i "$HOME/dotfiles/links/.config/icons/wallpaper.svg" "Wallpaper changed" "$WALLPAPER"
fi

