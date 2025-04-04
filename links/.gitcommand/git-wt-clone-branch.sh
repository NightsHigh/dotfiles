#!/bin/bash

# Ensure the user is inside a Git repository
# Find the root folder of the Git project (where .git is located)
REPO_DIR=$(pwd)
while [ ! -d "$REPO_DIR/.git" ]; do
    REPO_DIR=$(dirname "$REPO_DIR")

    if [ "$REPO_DIR" == "/" ]; then
        echo "Error: Could not find the root of the Git repository."
        exit 1
    fi
done
echo "Repository root directory: $REPO_DIR"

# Get the remote repository URL
REPO_URL=$(git config --get remote.origin.url)

# Fetch the available branches from the remote repository
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

# Define the features directory path where the worktree for the branch will be located
FEATURES_DIR="$REPO_DIR/features"
WORKTREE_DIR="$FEATURES_DIR/$branch"

# Create the features directory if it doesn't exist
mkdir -p "$FEATURES_DIR"

# Check if the worktree already exists for the selected branch
if [ -d "$WORKTREE_DIR" ]; then
    echo "Worktree for branch '$branch' already exists at: $WORKTREE_DIR"
    exit 1
else
    # Add the worktree for the selected branch
    echo "Adding worktree for branch '$branch' at: $WORKTREE_DIR"
    git worktree add "$WORKTREE_DIR" "$branch"
fi

# Output the path where the worktree is located
echo "Worktree for branch '$branch' is located at: $WORKTREE_DIR"


