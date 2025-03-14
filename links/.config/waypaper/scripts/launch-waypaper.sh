#!/bin/bash

if [ -e "$HOME/.zshrc" ]; then
    source "$HOME/dotfiles/links/.zshrc"
elif [ -e "$HOME/.bashrc" ]; then
    source "$HOME/dotfiles/links/.bashrc"
fi

#Fetch wallpapers
nohup wpg -a "$HOME/Wallpapers/*" &

sleep 0.2

nohup waypaper &

