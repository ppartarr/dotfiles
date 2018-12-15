#!/usr/bin/env bash

set -e

# shellcheck source=/dev/null
source ~/.dotfiles/packages.sh

for pkg in "${PKG[@]}"
do
  echo "Uninstalling ${pkg}..."
  sudo pacman -Rs "$pkg" --noconfirm
done

CURRENT_DIR=$PWD

dirs=$(find . -maxdepth 1 -mindepth 1 -type d -not -name '.git' -print)
for dir in $dirs
do
  echo "Uninsatlling ${dir}..."
  sh "$dir"/uninstall.sh
done

cd "$CURRENT_DIR"
