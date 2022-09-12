#!/usr/bin/env bash

################### dependence #####################
# package dependence:  ctags, ag(he_silver_searcher), cmake
# python dependence:   pep8, pyflake

BASEDIR="$(dirname "${BASH_SOURCE}")"
cd $BASEDIR
CURRENT_DIR=`pwd`

# Rsync ./links/* to ~/
function doIt() {

  echo "Step 1: Link neovim config to ~/.config/nvim"
  ln -s ~/workspace/dotfiles/nvim ~/.config/nvim

  echo "Step 2: install flake8 and autopep8 for python syntax checking and alefix"
  pip3 install flake8 autopep8 yapf

  echo "Step 3: Install eslint for js syntax checking"
  npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard \
        eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint \
        flow-bin

  echo "Step 4: update/install plugins using Vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  system_shell=$SHELL
  export SHELL="/bin/sh"
  nvim --headless -u $HOME/.config/nvim/vimrc.bundles +PlugInstall! +PlugClean! +qa
  export SHELL=$system_shell

  brew tap universal-ctags/universal-ctags
  brew install --HEAD universal-ctags

  # Patch fonts with a high number of glyphs (icons).
  echo "Step 5: Patch fonts with a high number of glyphs (icons). \nDon't forget to install the font: \
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
