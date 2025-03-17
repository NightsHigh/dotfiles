#!/bin/bash

mkdir -p "$HOME/.config/Vencord/themes"
mkdir -p "$HOME/.config/Vencord/settings"

yes | sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)" 
cp "$HOME/dotfiles/setup/initial_config/.config/Vencord/themes/Themecord.css" "$HOME/.config/Vencord/themes/"
cp "$HOME/dotfiles/setup/initial_config/.config/Vencord/settings/settings.json" "$HOME/.config/Vencord/settings/"

echo "Vencord is installed, it will finish setup when it's launched"
notify-send -t 6000 "Vencord installed launch steam!"

# Done, Discord will initialize BetterDiscord on its first run
