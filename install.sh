#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -fs ${BASEDIR}/.vimrc ~/.vimrc

# kitty
rm -rf ~/.config/kitty
ln -s  ${BASEDIR}/.config/kitty ~/.config/kitty

# nvim
rm -rf ~/.config/nvim
ln -s  ${BASEDIR}/.config/nvim ~/.config/nvim
