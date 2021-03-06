#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# what directories should be installable by all users including the root user
base=(
)

# folders that should, or only need to be installed for a local user
useronly=(
    shell
    vim
    zsh
    tmux
    xorg
    # bash
    # git
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr="$1"
    app="$2"
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t "$usr" "$app"
}

echo -e "Stowing apps for user: $USER\n"

# install apps available to local users and root
for app in ${base[@]}; do
    stowit "${HOME}" $app
done

# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$USER" = *"root"* ]]; then
        stowit "$HOME" $app
    fi
done
