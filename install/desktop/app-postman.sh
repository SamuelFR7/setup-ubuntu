#!/usr/bin/env bash

cd /tmp
curl https://dl.pstmn.io/download/latest/linux_64 --output ./postman-linux-x64.tar.gz
sudo mkdir -p /opt/Postman
sudo tar zxf ./postman-linux-x64.tar.gz -C /opt
sudo chown -R $USER:$USER /opt/Postman
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
sudo chown -R $USER:$USER /usr/local/bin/postman

POSTMAN_DESKTOP_FILE="/usr/share/applications/postman.desktop"

sudo bash -c "cat > $POSTMAN_DESKTOP_FILE" <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
cd -
