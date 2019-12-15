<h1 align="center">
  <a target="_blank" href="https://dotfiles.github.io">
    <img src="https://dotfiles.github.io/images/dotfiles-logo.png" alt="dotfiles" width="400px">
  </a>
</h1>

<p align="center">
  dotfiles for vim, zsh, tmux and more
</p>

<div align="center">
  <a href="https://github.com/ellerbrock/open-source-badge/">
    <img alt="Open Source Love" src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103" />
  </a>
  <a href="https://github.com/ellerbrock/open-source-badge/">
    <img alt="Bash Shell" src="https://badges.frapsoft.com/bash/v1/bash.png?v=103" />
  </a>
</div>

## Install
```bash
$ git clone git@github.com:ppartarr/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

## Usage
I use [stow](https://www.gnu.org/software/stow/) for managing symlinks. You can customise what tools you want the dotfiles for by commenting the name of the folder in the `setup.sh` script:
```bash
useronly=(
    # contains dotfiles shared by bash and zsh like .profile
    shell
    vim
    # pick either bash or zsh
    bash
    zsh
    git
)
```

Once you have configured which tools you want the dotfiles for, simply run
```bash
$ ./setup.sh
```

## License
[wtfpl](https://github.com/ppartarr/dotfiles/blob/master/LICENSE) @ [Philippe Partarrieu](https://partarrieu.me)
