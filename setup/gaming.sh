#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/tools/install_packages.sh" yay "$SCRIPT_DIR/packages/gaming_packages.txt"
