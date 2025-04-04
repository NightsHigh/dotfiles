#!/bin/bash

# Ensure we are in a git repository
if [ ! -d ".git" ]; then
    echo "This is not a git repository. Please navigate to a repository."
    exit 1
fi

# Prompt for the remote repository URL (if you have a specific one)
REPO_URL=$(git config --get remote.origin.url)

# If REPO_URL isn't set, prompt for it
if [ -z "$REPO_URL" ]; then
    echo "Remote repository URL not found. Please provide the remote URL (e.g., https://github.com/username/repository.git):"
    read -r REPO_URL
fi

# Fetch remote branches using git ls-remote
branches=($(git ls-remote --heads "$REPO_URL" | awk '{print $2}' | sed 's|refs/heads/||'))

# Check if there are branches available
if [ ${#branches[@]} -eq 0 ]; then
    echo "No branches found in the remote repository."
    exit 1
fi

# Display the number of branches
num_branches=${#branches[@]}
PS3="Please choose a branch to work with (1-$num_branches): "
echo "Number of branches: $num_branches"

# Prompt the user to select a branch
echo "Select a branch to clean up:"
select branch in "${branches[@]}"; do
    if [ -n "$branch" ]; then
        echo "You have selected branch: $branch"
        break
    else
        echo "Invalid selection, please try again."
    fi
done

# Ask for confirmation before deleting
echo "Are you sure you want to delete the branch '$branch' from both local and remote repositories? (y/n)"
read -r confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Branch deletion aborted."
    exit 0
fi

# Remove the worktree associated with the branch (if it exists)
echo "Removing worktree for branch '$branch'..."
git worktree remove "$branch"

# Delete the branch from the remote repository
echo "Deleting branch '$branch' from the remote repository..."
git push origin --delete "$branch"

# Delete the branch locally
echo "Deleting local branch '$branch'..."
git branch -D "$branch"

echo "Branch '$branch' has been cleaned up successfully."
