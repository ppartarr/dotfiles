#!/usr/bin/env bash

ERROR_MESSAGE='Usage: ./git.sh -e "email@address.com" -n "full name" -g "yes|no"'

while getopts :e:n:g: option; do
  case ${option} in
    e ) EMAIL=${OPTARG};;
    n ) NAME=${OPTARG};;
    g ) GPG=${OPTARG};;
    \? ) echo -e "$ERROR_MESSAGE";;
  esac
done

if [ ! -z "$EMAIL" ] || [ ! -z "$NAME" ]; then
  # configure git to use the provided email and name
  git config --global user.email "$EMAIL"
  git config --global user.name "$NAME"

  if [ ! -z "$GPG" ] && [ "$GPG" == "yes" ];then
    # Generate a GPG key
    echo "Generating GPG key..."
    gpg --full-generate-key
    KEY="$(gpg --list-secret-keys --keyid-format LONG | sed -n '/sec/p' | grep -o '\/[[:alnum:]]*' | cut -c 2- )"
    git config --global commit.gpgsign "$GPG"
    git config --global user.signingkey "$KEY"

    # copy public key and add to github
    echo -e '\nADD THIS GPG KEY TO YOUR GITHUB ACCOUNT \n'

    # add gpg key to .profile
    echo -e "Add this to your .profile:\n"
    echo -e "export GPG_TTY=\$(tty)"
    gpg --armor --export "$KEY"
  fi  

  # Create RSA key for ssh
  echo "Generating SSH key..."
  ssh-keygen -t rsa -b 3072 -C "$EMAIL" -f "$HOME/.ssh/git_rsa"
  eval "$(ssh-agent -s)"
  ssh-add "$HOME/.ssh/git_rsa"

  echo -e '\nADD THIS PUBLIC RSA KEY TO YOUR GITHUB ACCOUNT \n'
  cat "$HOME/.ssh/git_rsa.pub"
else
  echo $ERROR_MESSAGE
  exit 1
fi
