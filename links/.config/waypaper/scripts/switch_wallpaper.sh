#!/bin/bash

# Set the WALLPAPER variable to the provided argument
WALLPAPER=$(basename "$1")
echo $WALLPAPER

sleep 0.2


if [[ -n $WALLPAPER ]]; then

    # kill waybar process
    killall waypaper
    killall waybar

    sleep 0.5


    # Apply colorscheme
    wallust run "$WALLPAPER"
    pywal-discord -d "$WALLPAPER" &
    pywal-discord -t default &

    rm -rf "$HOME/Wallpapers/.current"
    cp "$HOME/.config/wpg/.current" "$HOME/Wallpapers/.current"


    # Start waybar again
    bash "$HOME/dotfiles/links/.config/waybar/launch-waybar.sh" &
    swaync-client -rs

    notify-send -t 6000 -i "$HOME/dotfiles/links/.config/icons/wallpaper.svg" "Wallpaper changed" "$WALLPAPER"
fi

