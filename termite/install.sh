#!/usr/bin/env bash

set -e

sudo pacman -Syu termite --needed --noconfirm

ln -svf ~/.dotfiles/termite/config ~/.config/termite/config
