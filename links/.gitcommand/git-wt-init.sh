#!/bin/bash

# Check if a repository URL is provided
if [ $# -lt 1 ]; then
    echo "Usage: git-wt-init <repo-name>"
    exit 1
fi

CURRENT_DIR=$(pwd)

REPO_URL_OR_NAME=$1
REPO_NAME=$(basename "$REPO_URL_OR_NAME" .git)
REPO_DIR="$CURRENT_DIR/$REPO_NAME"
GIT_DIR="$REPO_DIR/.git"
FEATURES_DIR="$REPO_DIR/features"

# Create the necessary directories
mkdir -p "$REPO_DIR" "$GIT_DIR" "$FEATURES_DIR"

# Initialize the bare Git repository
git init --bare "$GIT_DIR"

# Set the HEAD inside the bare repository
git --git-dir="$GIT_DIR" symbolic-ref HEAD refs/heads/main

# Create the main worktree
echo "Setting up the main branch..."
git --git-dir="$GIT_DIR" worktree add "$FEATURES_DIR/main" -b main

# Move into the worktree and make an initial commit
cd "$FEATURES_DIR/main"
touch README.md
git add README.md
git commit -m "Initial commit"

# Check if input is a URL (http or git)
if [[ "$REPO_URL_OR_NAME" =~ ^https?:// || "$REPO_URL_OR_NAME" =~ ^git@ ]]; then
    # Add the remote origin
    git remote add origin "$REPO_URL_OR_NAME"

    # Push the main branch
    git push -u origin main
    echo "Repository pushed to remote: $REPO_URL_OR_NAME"
else
    echo "Local repository created at: $REPO_DIR"
    echo "You can now create and manage branches in the 'features' directory."
fi

echo "Worktree setup complete at $FEATURES_DIR."
echo "You can now start creating new branches in the 'features' folder."


