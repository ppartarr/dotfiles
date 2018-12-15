#!/usr/bin/env bash

set -e

echo "Installing vim"
sudo pacman -Syu vim

ln -sfv ~/.dotfiles/vim/.vimrc ~/.vimrc
