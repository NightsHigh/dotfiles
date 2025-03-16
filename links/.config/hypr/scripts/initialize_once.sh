#!/bin/bash

if [ -e "$HOME/.zshrc" ]; then
    source "$HOME/dotfiles/links/.zshrc"
elif [ -e "$HOME/.bashrc" ]; then
    source "$HOME/dotfiles/links/.bashrc"
fi


# Define the path to the flag file
FLAG_FILE="$HOME/.initialized"

# Check if the flag file exists
if [ -e "$FLAG_FILE" ]; then
  echo "Script has already run. Exiting."
  exit 0
fi


swww img "$HOME/Wallpapers/default.png" --transition-step 20 --transition-fps 60 --transition-type center
sleep 2

# Wait until Hyprland is running
PROCESS_NAME="Hyprland"
until pgrep -x "$PROCESS_NAME" > /dev/null
do
  echo "Waiting for $PROCESS_NAME to start..."
  sleep 1  # Wait for 1 second before checking again
done

bash "$HOME/dotfiles/setup/system/hyprplugin.sh"

if [ -e "$HOME/.init_media_tools" ]; then
    echo "File exists."
    bash "$HOME/dotfiles/setup/applications/betterdiscord.sh"
    rm -rf "$HOME/.init_media_tools"
else
    echo "File does not exist."
fi

notify-send -t 6000 "Set your gtk theme!"
nwg-look

notify-send -t 6000 "Configure your monitor"
nwg-displays

swww img "$HOME/Wallpapers/default.png" --transition-step 20 --transition-fps 60 --transition-type center

notify-send -t 6000 "Configuration done!"

# Create the flag file to indicate the script has run
#
touch "$FLAG_FILE"
