#!/bin/bash

# Home folder cleanup
rm -rf "$HOME/Wallpapers"
rm -rf "$HOME/.icons"
rm -rf "$HOME/.tmux.conf"
rm -rf "$HOME/.gtkrc-2.0"
rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.bashrc"


# Config folder cleanup
rm -rf "$HOME/.config/kitty"
rm -rf "$HOME/.config/hypr"
rm -rf "$HOME/.config/wal"
rm -rf "$HOME/.config/wpg"
rm -rf "$HOME/.config/waypaper"
rm -rf "$HOME/.config/wlogout"
rm -rf "$HOME/.config/tofi"
rm -rf "$HOME/.config/gtk-3.0"
rm -rf "$HOME/.config/gtk-4.0"
rm -rf "$HOME/.config/xsettingsd"
rm -rf "$HOME/.config/nwg-look"
rm -rf "$HOME/.config/nwg-panel"
rm -rf "$HOME/.config/swappy"
rm -rf "$HOME/.config/swaync"
rm -rf "$HOME/.config/zsh"
rm -rf "$HOME/.config/icons"
rm -rf "$HOME/.config/BetterDiscord/data/stable/themes.json"
rm -rf "$HOME/.config/starship.toml"
rm -rf "$HOME/.config/wallust"

# Tmux folder cleanup
rm -rf "$HOME/.tmux/plugins/tmux-which-key/config.yaml"

echo "Files are cleared and ready to be symlinked"


