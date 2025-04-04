#!/bin/bash

# List all worktrees using git worktree list and strip the paths
worktrees=$(git worktree list --porcelain | awk '{print $2}')

# Check if there are any worktrees
if [ -z "$worktrees" ]; then
    echo "No worktrees found."
    exit 1
fi

# Display the list of worktrees
echo "Select a worktree to navigate to:"
select worktree in $worktrees; do
    if [ -n "$worktree" ]; then
        cd "$worktree" || { echo "Failed to cd into $worktree"; exit 1; }
        echo "You are now in $(pwd)"
        break
    else
        echo "Invalid selection. Please choose a valid worktree."
    fi
done

