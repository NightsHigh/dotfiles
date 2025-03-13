#!/bin/bash

# Remove files from the Git index
git rm --cached links/.config/hypr/monitors.conf
git rm --cached links/.config/BetterDiscord/themes/pywal-discord-default.theme.css
git rm --cached links/.config/wpg/sequences
git rm --cached links/.config/BetterDiscord/
git rm --cached links/.config/gtk-3.0/settings.ini
git rm --cached links/.config/hypr/conf/colors-hyprland.conf
git rm --cached links/.config/swaync/colors-swaync.css
git rm --cached links/.config/tofi/config
git rm --cached links/.config/waybar/colors-waybar.css
git rm --cached links/.config/waypaper/config.ini
git rm --cached links/.config/wlogout/colors-wlogout.css
git rm --cached links/.config/wpg/
git rm --cached links/.config/xsettingsd/xsettingsd.conf
git rm --cached links/.gtkrc-2.0
git rm --cached links/.icons/default/
git rm --cached links/Wallpapers/
echo "Avoiding the upload of desktop-specific settings"
