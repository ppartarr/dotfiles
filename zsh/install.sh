#!/usr/bin/env bash

set -e

sudo pacman -Syu zsh --needed --noconfirm

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -svf ~/.dotfiles/zsh/.zshrc ~

# install zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

chsh -s "$(command -v zsh)"
