#!/usr/bin/env sh

# exit on error
set -e

cd ~/.dotfiles

dirs=$(find . -maxdepth 1 -mindepth -type -d -not -name '.git' -print)
for dir in $dirs
do
  echo "Installing ${dir}..."
  sh "$dir/install.sh"
done

# betterlockscreen
systemctl enable betterlockscreen@philippe
