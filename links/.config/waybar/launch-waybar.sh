#!/bin/bash

# Source user environment (modify based on your shell)
if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi
if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi


# kill waybar process
killall waybar
sleep 0.2

# Start waybar
waybar -c "$HOME/dotfiles/links/.config/waybar/config.jsonc"  -s "$HOME/dotfiles/links/.config/waybar/styles.css"
