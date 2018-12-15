#!/usr/bin/env bash

set -e

sudo pacman -Syu termite --needed --noconfirm

ls -svf ~/.dotfiles/termite/config ~/.config/termite/config
