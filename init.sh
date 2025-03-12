#!/bin/bash

# Ensure the git hooks directory exists
mkdir -p "$HOME/dotfiles/.git/hooks"

# Copy the ignore_local_changes.sh script into the pre-push hook
cp "$HOME/dotfiles/githooks/ignore_local_changes.sh" "$HOME/dotfiles/.git/hooks/pre-push"

# Make the pre-push hook executable
chmod +x "$HOME/dotfiles/.git/hooks/pre-push"

echo "Pre-push hook setup complete. Local changes will now be ignored automatically on push."
