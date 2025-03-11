#!/bin/bash

# Define variables
SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")
DOTFILES_DIR="$SCRIPT_DIR/../../links/"
TARGET_DIR="$HOME"

# Check if the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}Error: Dotfiles directory '$DOTFILES_DIR' not found.${NC}" >&2
    exit 1
fi

# Navigate to the dotfiles directory
cd "$DOTFILES_DIR" || { echo "${RED}Error: Unable to change directory to $DOTFILES_DIR.${NC}" >&2; exit 1; }

# Use Stow to manage dotfiles
if stow -t "$TARGET_DIR" . --adopt > /dev/null 2>&1; then
    echo -e "${GREEN}Dotfiles successfully linked to $TARGET_DIR.${NC}"
else
    echo -e "${RED}Error: Failed to stow dotfiles.${NC}" >&2
    exit 1
fi

