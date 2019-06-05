<h1 align="center">
  <a target="_blank" href="https://dotfiles.github.io">
    <img src="https://dotfiles.github.io/images/dotfiles-logo.png" alt="dotfiles" width="400px">
  </a>
</h1>

<p align="center">
  dotfiles for vim, zsh, and tmux users
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
git clone https://github.com/ppartarr/dotfiles ~/.dotfiles
cd ~/.dotfiles
pip install dotfiles
```

### Usage

Run `dotfiles --help` for some information about the available commands and what they do
```
Usage: dotfiles [OPTIONS] COMMAND [ARGS]...

  Setup your dotfiles.

Options:
  --help  Show this message and exit.

Commands:
  clean      Removes all creates symlinks to dotfiles
  install    Install packages in packages.py
  symlink    Creates symlinks from dotfiles to user's home
  uninstall  Uninstall packages in packages.py
```

For additional information about each command, run `dotfiles COMMAND --help`

## Developement
###  Activate the virtual environment
Run this command to use virtualenv and avoid installing pip packages globally `. venv/bin/activate` 

### Install
You can install the cli tool with hot-reloading using: `pip install --editable . --user`. That's it, you can start working now!


## License
[wtfpl](https://github.com/ppartarr/dotfiles/blob/master/LICENSE) @ [Philippe Partarrieu](https://partarrieu.me)
