from setuptools import setup

setup(
  name="Dotfiles",
  version="0.0.1",
  py_modules=["dotfiles"],
  install_requires=[
    "click",
    "distro"
  ],
  entry_points='''
    [console_scripts]
    dotfiles=dotfiles:cli
  '''
)
