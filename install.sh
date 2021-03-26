#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -fs ${BASEDIR}/.vimrc ~/.vimrc
ln -fs ${BASEDIR}/.vimrc ~/.config/nvim/init.vim 

# kitty
rm -rf ~/.config/kitty 
ln -s  ${BASEDIR}/.config/kitty ~/.config/kitty

# i3 WM
mkdir ~/.config/i3
ln -s ${BASEDIR}/.config/i3/config ~/.config/i3/config
mkdir ~/.config/rofi
ln -s ${BASEDIR}/.config/rofi/nord.rasi ~/.config/rofi/nord.rasi
