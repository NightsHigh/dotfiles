#!/bin/bash

# Apply skip-worktree to all the specified files
git update-index --skip-worktree links/.config/hypr/monitors.conf
git update-index --skip-worktree links/.config/BetterDiscord/themes/pywal-discord-default.theme.css
git update-index --skip-worktree links/.config/wpg/sequences
git update-index --skip-worktree links/.config/BetterDiscord/
git update-index --skip-worktree links/.config/gtk-3.0/settings.ini
git update-index --skip-worktree links/.config/hypr/conf/colors-hyprland.conf
git update-index --skip-worktree links/.config/swaync/colors-swaync.css
git update-index --skip-worktree links/.config/tofi/config
git update-index --skip-worktree links/.config/waybar/colors-waybar.css
git update-index --skip-worktree links/.config/waypaper/config.ini
git update-index --skip-worktree links/.config/wlogout/colors-wlogout.css

# Ignore all WPG config, except wp_init.sh if needed
git update-index --skip-worktree links/.config/wpg/
git update-index --skip-worktree links/.config/xsettingsd/xsettingsd.conf
git update-index --skip-worktree links/.gtkrc-2.0
git update-index --skip-worktree links/.icons/default/

# Ignore wallpapers (entire directory)
git update-index --skip-worktree links/Wallpapers/

echo "Skip-worktree flags applied after checkout."
