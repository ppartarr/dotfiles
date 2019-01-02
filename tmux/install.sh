#!/usr/bin/env bash

set -e

sudo pacman -Syu tmux --needed --noconfirm

ln -svf ~/.dotfiles/tmux/.tmux.conf ~
ln -svf ~/.dotfiles/tmux/.tmux.conf.local ~
