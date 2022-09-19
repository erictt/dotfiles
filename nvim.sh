#!/usr/bin/env bash

BASEDIR="$(dirname "${BASH_SOURCE}")"
cd $BASEDIR
CURRENT_DIR=`pwd`

ln -s ~/workspace/dotfiles/nvim ~/.config/nvim

nvim --headless +qa

brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

# Patch fonts with a high number of glyphs (icons). 
# Don't forget to install the font:
#   https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
