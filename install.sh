#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# nvim
rm -rf ~/.config/nvim
ln -s  ${BASEDIR}/.config/nvim ~/.config/nvim

# zellij
rm -rf ~/.config/zellij
ln -s ${BASEDIR}/.config/zellij ~/.config/zellij

rm ~/.tool-versions
ln -s ${BASEDIR}/.tool-versions ~/.tool-versions

rm ~/.zshrc
ln -s ${BASEDIR}/.zshrc ~/.zshrc

