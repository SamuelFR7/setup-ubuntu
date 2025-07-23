#!/usr/bin/env bash

sudo apt install zsh -y
sudo usermod -s $(which zsh) $(whoami)