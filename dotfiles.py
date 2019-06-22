import click
import glob
import os
import distro
import subprocess

import utils
from packages import packages

@click.group()
def cli():
  """Setup your dotfiles."""
  pass

@cli.command()
@click.option('--dotfiles', default=glob.glob('./files/*/.*'), help='List of dotfile paths as strings i.e. ["./.vim", "./.zsh"]')
@click.option('--home', envvar='HOME', help='Destination directory for symlink to be created in, defaults to $HOME')
def symlink(dotfiles, home):
  """Creates symlinks from dotfiles to user's home"""
  for dotfile in dotfiles:
    filename = utils.remove_filename_prefix(dotfile)
    destination = home + '/' + filename
    click.echo('Creating symlink for %s' % filename)

    if os.path.islink(destination):
      click.echo('Symlink already exists\n')
    else: 
      realpath = os.path.realpath(dotfile)
      os.symlink(realpath, destination)
      click.echo('Symlink created\n')
     

@cli.command()
@click.option('--dotfiles', default=glob.glob('./files/*/.*'), help='List of dotfile paths as strings i.e. ["./.vim", "./.zsh"]')
@click.option('--home', envvar='HOME', help='Destination directory for symlink to be created in, defaults to $HOME')
def clean(dotfiles, home):
  """Removes all created symlinks to dotfiles"""
  for dotfile in dotfiles:
    filename = utils.remove_filename_prefix(dotfile)
    symlink_path = home + '/' + filename
    if os.path.islink(symlink_path):
      click.echo('Removing %s symlink' % dotfile)
      os.unlink(symlink_path)
  

@cli.command()
@click.option('-p', '--password', prompt=True, hide_input=True, help='Password for sudo')
def install(password):
  """Install packages in packages.py"""
  # Using os with pacman
  if 'Arch' in distro.name() or 'Antergos' in distro.name():
    packages_string = ' '.join(str(p) for p in packages)
    click.echo('Installing packages %s\n' % packages_string)
    process = subprocess.Popen(['sudo', '-S'] + 'pacman -Sy --noconfirm'.split() + packages, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
    process.communicate(password.encode())
    click.echo('Installation finished')

@cli.command()
@click.option('-p', '--password', prompt=True, hide_input=True, help='Password for sudo')
def uninstall(password):
  """Uninstall packages in packages.py - USE WITH CAUTION"""
  packages_string = ' '.join(str(p) for p in packages)
  click.echo('Uninstalling packages %s\n' % packages_string)
  process = subprocess.Popen(['sudo', '-S'] + 'pacman -R --noconfirm'.split() + packages, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
  process.communicate(password.encode())
  click.echo('Uninstallation finished')
