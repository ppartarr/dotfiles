#!/usr/bin/env bash

# exit on error
set -e

# install official and aur packages
source ~/.dotfiles/packages.sh

for pkg in "${PKG[@]}"
do
  echo "Installing ${pkg}..."
  sudo pacman -Syu "$pkg" --needed --noconfirm
done

for aur in "${AUR[@]}"
do
  echo "Installing ${aur}..."
  sudo yaourt -Syu "$aur" --needed --noconfirm
done

# install dotfiles
cd ~/.dotfiles

dirs=$(find . -maxdepth 1 -mindepth -type -d -not -name '.git' -print)
for dir in $dirs
do
  echo "Installing ${dir}..."
  sh "$dir/install.sh"
done

# betterlockscreen
systemctl enable betterlockscreen@philippe
