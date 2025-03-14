#!/bin/bash

notify-send -t 10000 "Installing hyprland plugins wait a while..."
# add hyprland plugins
hyprpm update
yes | hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm update
hyprpm enable hyprexpo
hyprpm enable hyprbars


notify-send -t 10000 "Hyprland plugins done!"
