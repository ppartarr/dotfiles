#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update


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

# install only user space folders
for app in ${useronly[@]}; do
    if [[ ! "$USER" = *"root"* ]]; then
        stowit "$HOME" $app
    fi
done

if [[ "${useronly[@]}" =~ "${xorg}" ]]; then
  cp -R .xcolors ~/.xcolors
fi

cp -r ./bin ~/bin/
