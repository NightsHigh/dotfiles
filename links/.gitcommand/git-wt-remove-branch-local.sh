#!/bin/bash

# Check if branch name is provided
if [ $# -lt 1 ]; then
    echo "Usage: git wt-rm <branch-name>"
    exit 1
fi

BRANCH_NAME=$1

# Prompt for confirmation
read -p "Are you sure you want to remove the local branch and worktree '$BRANCH_NAME'? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "Operation canceled."
    exit 0
fi

# Remove the worktree and branch locally
git worktree remove --force "$BRANCH_NAME" || { echo "Failed to remove worktree."; exit 1; }
git branch -D "$BRANCH_NAME" 2>/dev/null || { echo "Failed to delete branch."; exit 1; }
git worktree prune

echo "Branch '$BRANCH_NAME' and associated worktree removed locally."
