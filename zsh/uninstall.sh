#!/usr/bin/env bash

sudo pacman -Rs zsh --needed --noconfirm

rm -rf ~/.oh-my-zsh

unlink ~/.envvars
unlink ~/.zshrc

chsh -s "$(command -v bash)"
