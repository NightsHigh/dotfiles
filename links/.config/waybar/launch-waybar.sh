#!/bin/bash

if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# kill waybar process
killall waybar
sleep 0.2

# Start waybar
waybar -c "$HOME/dotfiles/links/.config/waybar/config.jsonc"  -s "$HOME/dotfiles/links/.config/waybar/styles.css"
