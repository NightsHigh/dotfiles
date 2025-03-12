#!/bin/bash

if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi

#Fetch wallpapers
nohup wpg -a ~/dotfiles/links/Wallpapers/* &

sleep 0.2

nohup waypaper &

