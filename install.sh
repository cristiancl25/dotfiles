#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -fs ${BASEDIR}/.vimrc ~/.vimrc
ln -fs ${BASEDIR}/.vimrc ~/.config/nvim/init.vim 

# kitty
rm -rf ~/.config/kitty 
ln -s  ${BASEDIR}/.config/kitty ~/.config/kitty
