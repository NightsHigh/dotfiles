#!/bin/bash

# Ensure the user is inside a Git repository
REPO_DIR=$(pwd)
while [ ! -d "$REPO_DIR/.git" ]; do
    REPO_DIR=$(dirname "$REPO_DIR")
    if [ "$REPO_DIR" == "/" ]; then
        echo "Error: Could not find the root of the Git repository."
        exit 1
    fi
done

# Define the features directory path where the worktree will be located
BRANCH_DIR="$REPO_DIR"

# List remote branches
echo "Fetching branches for $REPO_URL..."
REPO_URL=$(git config --get remote.origin.url)
branches=$(git ls-remote --heads "$REPO_URL" | awk '{print $2}' | sed 's|refs/heads/||')

# Check if there are branches available
if [ -z "$branches" ]; then
    echo "No branches found in the remote repository."
    exit 1
fi



# Ask the user to select a branch
echo "Select a branch to inherit from:"
select base_branch in $branches; do
    if [ -n "$base_branch" ]; then
        echo "You have selected branch: $base_branch"
        break
    else
        echo "Invalid selection, try again."
    fi
done


# Ask for the new branch name
echo "Enter the new branch name:"
read branch_name

git worktree add -b "$branch_name" "$BRANCH_DIR/$branch_name" "$base_branch"

read -p "Do you want to push '$branch_name' to Git? (y/n) " upload_choice

if [[ "$upload_choice" =~ ^[Yy]$ ]]; then
    git -C "$BRANCH_DIR/$branch_name" push --set-upstream origin "$branch_name"
    echo "✅ Branch '$branch_name' has been pushed to remote!"
else
    echo "⏳ Skipping upload. You can push later using:"
    echo "   git -C \"$BRANCH_DIR/$branch_name\" push --set-upstream origin \"$branch_name\""
fi

echo "Worktree for branch '$branch_name' has been created at $BRANCH_DIR/$branch_name"

