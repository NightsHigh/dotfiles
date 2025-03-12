#!/bin/bash

git clone https://github.com/JaKooLit/simple-sddm.git ~/simple-sddm
sudo mv ~/simple-sddm /usr/share/sddm/themes/
sudo cp "$HOME/dotfiles/setup/system/sddm.conf" "/etc/"

