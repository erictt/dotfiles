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

  echo "Step1: Sync all dotfiles to ~/"

	rsync	--exclude ".DS_Store" \
		-avh --no-perms ./vim/ ~;

  echo "Step2: update/install plugins using Vim-plug"
  system_shell=$SHELL
  export SHELL="/bin/sh"
  vim -u $HOME/.vimrc.bundles +PlugInstall! +PlugClean! +qall
  export SHELL=$system_shell

  echo "Step3: compile YouCompleteMe"
  echo "It will take a long time, just be patient!"
  echo "If error,you need to compile it yourself"
  echo "cd ~/.vim/bundle/YouCompleteMe/ && python install.py --clang-completer"
  cd ~/.vim/bundle/YouCompleteMe/
  git submodule update --init --recursive
  if [ `which clang` ]   # check system clang
  then
      python install.py --clang-completer --system-libclang   # use system clang
  else
      python install.py --clang-completer
  fi
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
