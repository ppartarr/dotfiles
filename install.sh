#!/usr/bin/env bash

# exit on error
set -e

# Add source to suppress shellcheck error
# https://github.com/koalaman/shellcheck/wiki/Sc1090
# shellcheck source=/dev/null
. "$HOME/.dotfiles/packages.sh"

# Install core packages
for pkg in "${PKG[@]}"
do
  echo "Installing ${pkg}..."
  sudo pacman -Syu "$pkg" --needed --noconfirm
done

# Install AUR packages
for aur in "${AUR[@]}"
do
  echo "Installing ${aur}..."
  yay -Syu "$aur" --needed --noconfirm
done

# Install dotfiles
cd ~/.dotfiles

dirs=$(find . -maxdepth 1 -mindepth -type -d -not -name '.git' -print)
for dir in $dirs
do
  echo "Installing ${dir}..."
  sh "$dir/install.sh"
done
