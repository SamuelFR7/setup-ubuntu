#!/usr/bin/env bash

if ! command -v google-chrome-stable &> /dev/null; then
    cd /tmp
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
    xdg-settings set default-web-browser google-chrome.desktop
    cd -
fi