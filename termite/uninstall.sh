#!/usr/bin/env bash

set -e

sudo pacman -Rs termite

unlink ~/.config/termite/config
