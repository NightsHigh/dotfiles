#!/bin/bash

# Download the install script
curl -O https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh

# Start the installation process and pipe responses to it
{
    # Simulate pressing Enter to select "Install Vencord"
    echo -e "\r"
    sleep 1  # Wait to ensure the script catches the input
    
    # Simulate pressing Enter to select "Stable - /opt/discord"
    echo -e "\r"
    sleep 1  # Wait to ensure the script catches the input

    # Optionally, handle any other confirmations
    # If you see additional prompts like "Do you want to continue?", you can simulate answering them like this:
    echo -e "y"  # Respond "yes"
    sleep 1
} | bash install.sh  # Run the install script

if [ -f "$HOME/.config/Vencord/dist/patcher.js" ]; then
  cp "$HOME/dotfiles/setup/initial_config/.config/Vencord/themes/Themecord.css" "$HOME/.config/Vencord/themes/"
  cp "$HOME/dotfiles/setup/initial_config/.config/Vencord/settings/settings.json" "$HOME/.config/Vencord/settings/"
else
  echo "Vencord installation not completed. Please check for errors."
fi

echo "Vencord is installed, it will finish setup when it's launched"
notify-send -t 6000 "Vencord installed launch steam!"

# Done, Discord will initialize BetterDiscord on its first run
