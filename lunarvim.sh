#!/usr/bin/env bash

BASEDIR="$(dirname "${BASH_SOURCE}")"
cd $BASEDIR
CURRENT_DIR=`pwd`

# Rsync ./links/* to ~/
function doIt() {

  echo "Step 1: Install dependences"
  # TODO 

  echo "Step 2: Install lunarvim"
  # TODO 

  echo "Step 3: Link lunarvim config to ~/.config/lvim/"
  ln -s ./lvim/config.lua ~/.config/lvim/config.lua

  # Patch fonts with a high number of glyphs (icons).
  echo "Step 4: Patch fonts with a high number of glyphs (icons). \nDon't forget to install the font: \
    \n https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

echo "Install Done!"
