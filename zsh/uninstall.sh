#!/usr/bin/env bash

sudo pacman -Rs zsh --needed --noconfirm

unlink ~/.envvars
unlink ~/.zshrc

chsh -s "$(command -v bash)"
