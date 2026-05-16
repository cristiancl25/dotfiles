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

# git (solo el fichero config, para no pisar ~/.config/git/ignore u otros)
mkdir -p ~/.config/git
rm -f ~/.config/git/config
ln -s ${BASEDIR}/.config/git/config ~/.config/git/config

# lazygit
mkdir -p ~/.config/lazygit
rm -f ~/.config/lazygit/config.yml
ln -s ${BASEDIR}/.config/lazygit/config.yml ~/.config/lazygit/config.yml

# k9s (config.yaml NO se versiona: k9s lo muta con defaultView)
mkdir -p ~/.config/k9s/skins
rm -f ~/.config/k9s/aliases.yaml ~/.config/k9s/hotkeys.yaml ~/.config/k9s/skins/gruvbox-dark.yaml
ln -s ${BASEDIR}/.config/k9s/aliases.yaml ~/.config/k9s/aliases.yaml
ln -s ${BASEDIR}/.config/k9s/hotkeys.yaml ~/.config/k9s/hotkeys.yaml
ln -s ${BASEDIR}/.config/k9s/skins/gruvbox-dark.yaml ~/.config/k9s/skins/gruvbox-dark.yaml

