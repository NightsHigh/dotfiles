#!/bin/bash

# Path to this init.sh script
INIT_SCRIPT="$HOME/dotfiles/init.sh"

# Path to the git hooks directory
HOOKS_DIR="$HOME/dotfiles/.git/hooks"
POST_MERGE_HOOK="$HOOKS_DIR/post-merge"

# Ensure the git hooks directory exists
mkdir -p "$HOOKS_DIR"


bash "$HOME/dotfiles/githooks/ignore_local_changes.sh"

cat > "$POST_MERGE_HOOK" <<EOL
#!/bin/bash

# Call init.sh after pulling changes (i.e., after git pull)
echo "Running init.sh after pull..."
bash "$INIT_SCRIPT"
EOL

# Make the post-merge hook executable
chmod +x "$POST_MERGE_HOOK"

echo "Post-merge hook set up successfully. 'init.sh' will run after every pull."
