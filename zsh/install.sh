#!/usr/bin/env bash

set -e

echo "Installing zsh with oh-my-zsh"
sudo pacman -Syu zsh --needed --noconfirm

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

chsh -s "$(command -v zsh)"
