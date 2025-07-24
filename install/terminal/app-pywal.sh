#!/usr/bin/env bash

if ! command -v wal &> /dev/null; then
    sudo apt install pipx -y
    pipx install pywal16
    export PATH="$HOME/.local/bin:$PATH"
    wal --theme gruvbox
fi