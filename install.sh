#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

export PATH="$HOME/.local/bin:$PATH"

# Check if script is in "www" folder
if [ "$PWD" != "/home/$USER/www/setup-ubuntu" ]; then
    echo "Error: This script must be run from /home/$USER/www/setup-ubuntu/"
    echo "Current directory: $PWD"
    exit 1
fi

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/www/setup-ubuntu/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/www/setup-ubuntu/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source ~/www/setup-ubuntu/install/terminal.sh
fi
