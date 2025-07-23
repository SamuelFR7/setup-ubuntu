#!/usr/bin/env bash

cd /tmp
mkdir -p ~/.local/share/sfr/applications/icons
cp ~/www/setup-ubuntu/assets/cursor.png ~/.local/share/sfr/applications/icons/cursor.png
curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
sudo mv cursor.appimage /opt/cursor.appimage
sudo chmod +x /opt/cursor.appimage
sudo apt install -y fuse3
sudo apt install -y libfuse2t64

CURSOR_DESKTOP_FILE="/usr/share/applications/cursor.desktop"

sudo bash -c "cat > $CURSOR_DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor.appimage --no-sandbox
Icon=/home/$USER/.local/share/sfr/applications/icons/cursor.png
Type=Application
Categories=Development;IDE;
EOL

cd -