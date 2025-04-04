#### ─── History ───────────────────────────────────────────────────────────
HISTSIZE=1000000
SAVEHIST=1000000
# HISTFILE="$XDG_DATA_HOME/zsh/history"

### ─── Editor & Terminal ─────────────────────────────────────────────────
export EDITOR="nvim"
export TERMINAL="kitty"
export TERM="xterm-256color"
export MANPAGER='nvim +Man!'
export MANWIDTH=999

### ─── XDG & Desktop ─────────────────────────────────────────────────────
export XDG_CURRENT_DESKTOP="Wayland"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

### ─── PATH Management ───────────────────────────────────────────────────
autoload -U add-zsh-hook

# Dedup PATH entries
dedup_path() {
  local tmppath
  tmppath="$(echo "$PATH" | awk -v RS=: '!a[$1]++' | paste -sd:)"
  export PATH="$tmppath"
}

# Add multiple paths cleanly
path_add() {
  for dir in "$@"; do
    [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]] && PATH="$dir:$PATH"
  done
}

path_add \
  "$HOME/.local/bin" \
  "$HOME/.docker/bin" \
  "$HOME/.cargo/bin" \
  "$HOME/.local/share/go/bin" \
  "$HOME/.fnm" \
  "$HOME/.local/share/neovim/bin" \
  "/opt/flutter/bin" \
  "$HOME/.pub-cache/bin" \
  "/opt/flutter" \
  "$HOME/.dotnet/tools" \
  "/usr/share/dotnet" \
  "$HOME/.tmux/plugins/tmuxifier/bin"

# Dotnet setup
export DOTNET_ROOT="$HOME/.dotnet"
path_add "$DOTNET_ROOT" "$DOTNET_ROOT/tools"

dedup_path

### ─── Tmuxifier ─────────────────────────────────────────────────────────
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"

### ─── Starship Prompt ───────────────────────────────────────────────────
eval "$(starship init zsh)"

### ─── Optional Completions ──────────────────────────────────────────────
# eval "$(pip completion --zsh)"
# export PATH="$PATH:./node_modules/.bin"

