#!/usr/bin/env bash

set -e

sudo pacman -Rs vim --noconfirm

rm -rf ~/.vim

unlink ~/.vimrc
