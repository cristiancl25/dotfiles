#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# nvim
rm -rf ~/.config/nvim
ln -s  ${BASEDIR}/.config/nvim ~/.config/nvim

# kitty
rm -rf ~/.config/kitty
ln -s  ${BASEDIR}/.config/kitty ~/.config/kitty

# i3 WM
rm -rf ~/config/i3
ln -s ${BASEDIR}/.config/i3 ~/.config/i3
rm -rf ~/.config/rofi
ln -s ${BASEDIR}/.config/rofi ~/.config/rofi
