#!/bin/bash

TARGET_DIR="$HOME/.config/nvim"
git clone https://github.com/eske4/klintoe-nvim-config "$TARGET_DIR"
"$TARGET_DIR/install.sh" # Run script part of the repo to install packages to improve nvim experience

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/tools/install_packages.sh" yay "$SCRIPT_DIR/packages/developer_packages.txt"
