#!/bin/bash

# Ensure the files are removed from staging before commit
git reset HEAD links/.config/hypr/monitors.conf
git reset HEAD links/.config/BetterDiscord/themes/pywal-discord-default.theme.css
git reset HEAD links/.config/wpg/sequences
git reset HEAD links/.config/BetterDiscord/
git reset HEAD links/.config/gtk-3.0/settings.ini
git reset HEAD links/.config/hypr/conf/colors-hyprland.conf
git reset HEAD links/.config/swaync/colors-swaync.css
git reset HEAD links/.config/tofi/config
git reset HEAD links/.config/waybar/colors-waybar.css
git reset HEAD links/.config/waypaper/config.ini
git reset HEAD links/.config/wlogout/colors-wlogout.css
git reset HEAD links/.config/wpg/
git reset HEAD links/.config/xsettingsd/xsettingsd.conf
git reset HEAD links/.gtkrc-2.0
git reset HEAD links/.icons/default/

# Optionally, you can add these to .gitignore if not already done
# echo "links/.config/hypr/monitors.conf" >> .gitignore
# echo "links/Wallpapers/" >> .gitignore

echo "Excluded desktop-specific settings from the commit."
