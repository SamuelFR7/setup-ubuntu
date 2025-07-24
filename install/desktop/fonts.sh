#!/usr/bin/env bash

if [[ ! -f ~/.local/share/fonts/JetBrainsMono-Regular.ttf || \
      ! -f ~/.local/share/fonts/iAWriterMonoS-Regular.ttf ]]; then

  mkdir -p ~/.local/share/fonts

  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d JetBrainsFont
  cp JetBrainsFont/*.ttf ~/.local/share/fonts
  rm -rf JetBrainsMono.zip JetBrainsFont

  wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
  unzip iafonts.zip -d iaFonts
  cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts
  rm -rf iafonts.zip iaFonts

  fc-cache
  cd -

fi