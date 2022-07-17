#!/usr/bin/env bash

################### dependence #####################
# package dependence:  ctags, ag(he_silver_searcher), cmake
# python dependence:   pep8, pyflake

BASEDIR="$(dirname "${BASH_SOURCE}")"
cd $BASEDIR
CURRENT_DIR=`pwd`

function lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

# Rsync ./links/* to ~/
function doIt() {

  echo "Step 1: Sync all neovim config to ~/.config/nvim/"
  rsync --exclude ".DS_Store" -avh --no-perms ./nvim/ ~/.config/nvim/;

  echo "Step 2: install flake8 and autopep8 for python syntax checking and alefix"
  pip3 install flake8 autopep8 yapf

  echo "Step 3: Install eslint for js and html syntax checking"
  npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard \
        eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint \
        flow-bin

  echo "Step 4: update/install plugins using Vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  system_shell=$SHELL
  export SHELL="/bin/sh"
  nvim -u $HOME/.config/nvim/vimrc.bundles +PlugInstall! +PlugClean! +qall
  export SHELL=$system_shell

  brew tap universal-ctags/universal-ctags
  brew install --HEAD universal-ctags

  # echo "Step 5: compile YouCompleteMe"
  # echo "cd ~/.vim/bundle/YouCompleteMe/ && python install.py --clang-completer"
  # cd ~/.vim/bundle/YouCompleteMe/
  # python install.py --clang-completer
  # python install.py --go-completer
  # python install.py --java-completer
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
