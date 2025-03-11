#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.docker/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export PATH=$HOME/.fnm:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export XDG_CURRENT_DESKTOP="Wayland"
#export PATH="$PATH:./node_modules/.bin"
eval "$(starship init zsh)"
# eval "`pip completion --zsh`"
#
export PATH="/opt/flutter/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"/opt/flutter/"
export PATH="$PATH:/home/KlintoE/.dotnet/tools"
export PATH="$PATH:/usr/share/dotnet"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export TERM=xterm-256color
export PATH="$PATH:$HOME/.tmux/plugins/tmuxifier/bin"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export EDITOR=nvim
