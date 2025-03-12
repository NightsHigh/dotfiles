#!/bin/bash

# kill waybar process
killall waybar
sleep 0.2

# Start waybar
waybar -c "$HOME/dotfiles/links/.config/waybar/config.jsonc"  -s "$HOME/dotfiles/links/.config/waybar/styles.css"
