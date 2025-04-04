##!/bin/sh

# === Configuration & Editor ===
alias nvimconf='nvim ~/.config/nvim/'   # Open Neovim config

# === Colorized Output ===
# Colorize grep output for easier readability (especially in logs)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# === File Operations (with confirmation) ===
# Confirm before overwriting files
alias cp="cp -i"  # Prompt before overwriting files during copy
alias mv="mv -i"  # Prompt before overwriting files during move
alias rm="rm -i"  # Prompt before deleting files

# === Disk & System Info ===
# Display disk usage in human-readable format (e.g., GB, MB)
alias df='df -h'

# Show memory usage in MB
alias free='free -m'

# === Process Monitoring ===
# Get the top 5 processes eating the most memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# Get the top 5 processes eating the most CPU
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# === Systemd ===
# List all systemd unit files
alias all_services="systemctl list-unit-files --all"

# === Navigation Shortcuts ===
alias ..="cd .."           # Go up one directory
alias ...="cd ../.."       # Go up two directories
alias ....="cd ../../.."  # Go up three directories
alias ~="cd ~"             # Go to the home directory
alias cd..="cd .."         # Simplified `cd ..`

# === Network & IP Info ===
# Get external IP and other information
alias ipinfo="curl ipinfo.io"

# Get external IP using ifconfig
alias myip="curl ifconfig.me"

# === System Performance ===
# Get CPU info (using lscpu)
alias cpuinfo='lscpu'

# Show memory info in human-readable format
alias meminfo='free -h'

# Show directory sizes for the current directory and subdirectories
alias diskusage='du -sh *'

# === Search & Find ===
# Find all files in the current directory (recursive)
alias findf="find . -type f"

# Find all directories in the current directory (recursive)
alias findd="find . -type d"

# === General Shortcuts ===
# Reload the Zsh configuration (useful after editing .zshrc)
alias reload="source ~/.zshrc"

# Show command history
alias h="history"

# Clear the terminal screen
alias c="clear"

alias search="find . -iname"
alias searchdir="find . -type d -iname"
alias searchf="find . -type f -iname"


