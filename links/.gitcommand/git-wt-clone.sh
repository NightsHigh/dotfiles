#!/bin/bash

# Check if repository URL is provided, if not, show usage
if [ $# -lt 1 ]; then
    echo "Usage: git wt-clone <repo-url>"
    exit 1
fi

REPO_URL=$1
REPO_NAME=$(basename "$REPO_URL" .git)  # Get the repo name, stripping .git suffix

CURRENT_DIR=$(pwd)
# Directory where the bare repository and worktrees will be stored
BASE_DIR="$CURRENT_DIR/$REPO_NAME"
FEATURES_DIR="$BASE_DIR/features"
GIT_DIR="$BASE_DIR/.git"

# Clone the repository as a bare repo (initialize .git in the base dir)
if [ ! -d "$BASE_DIR" ]; then
    echo "Cloning repository from $REPO_URL into $BASE_DIR..."
    git clone --bare "$REPO_URL" "$GIT_DIR"
else
    echo "Bare repository already exists at: $BASE_DIR"
    exit 1
fi

# Fetch the remote branches
echo "Fetching branches for $REPO_URL..."
branches=$(git ls-remote --heads "$REPO_URL" | awk '{print $2}' | sed 's|refs/heads/||')

# Check if there are branches available
if [ -z "$branches" ]; then
    echo "No branches found in the remote repository."
    exit 1
fi

# Prompt the user to select a branch
echo "Select a branch to work with:"
select branch in $branches; do
    if [ -n "$branch" ]; then
        echo "You have selected branch: $branch"
        break
    else
        echo "Invalid selection, try again."
    fi
done


# Define the worktree directory for the selected branch
WORKTREE_DIR="$FEATURES_DIR/$branch"

# Check if the worktree already exists for the selected branch
if [ -d "$WORKTREE_DIR" ]; then
    echo "Worktree for branch '$branch' already exists at: $WORKTREE_DIR"
    exit 1
else
    # Create the worktree for the selected branch
    echo "Creating worktree for branch '$branch' at: $WORKTREE_DIR"
    git --git-dir="$GIT_DIR" worktree add "$WORKTREE_DIR" "$branch"
fi

# Output path where worktree is located
echo "Worktree for branch '$branch' is set up at: $WORKTREE_DIR"

