#!/usr/bin/env bash

set -e

sudo pacman -Syu zsh --needed --noconfirm

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -svf ~/.dotfiles/zsh/.envvars ~
ln -svf ~/.dotfiles/zsh/.zshrc ~

chsh -s "$(command -v zsh)"
