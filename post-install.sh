#!/usr/bin/env bash

if ! op account get &>/dev/null; then
    echo "Por favor, faça login no 1Password CLI primeiro: op signin"
    exit 1
fi

op document get "i3rjiohtbjyrqznaon4oia4el4" --out-file "/home/$USER/.ssh/dotfiles-key"
chmod 600 "/home/$USER/.ssh/dotfiles-key"

op item get "fe53jvhvfhdpiz65cpufmwvvqy" --fields private_key > "/home/$USER/.ssh/id_ed25519"
op item get "fe53jvhvfhdpiz65cpufmwvvqy" --fields public_key > "/home/$USER/.ssh/id_ed25519.pub"
chmod 600 "/home/$USER/.ssh/id_ed25519"
chmod 644 "/home/$USER/.ssh/id_ed25519.pub"

ssh-add "/home/$USER/.ssh/id_ed25519"

cd "/home/$USER"
git clone git@github.com:SamuelFR7/new_dotfiles.git dotfiles
cd "/home/$USER/dotfiles"
stow atalhos
rm -rf "/home/$USER/.config/btop"
stow btop
stow scripts
stow crontab
"/home/$USER/.local/scripts/apply_crontab"
rm -rf "/home/$USER/.config/git"
stow git
rm -rf "/home/$USER/.config/ghostty"
stow ghostty
rm -rf "/home/$USER/.config/nvim"
stow nvim
stow ssh
stow starship
stow tmux
rm "/home/$USER/.zshrc"
stow zsh
cd -
