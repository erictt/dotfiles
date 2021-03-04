#!/usr/bin/env bash


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
  # Install oh my zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install spaceship theme
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

	rsync	--exclude ".DS_Store" \
		--exclude ".osx" \
		-avh --no-perms ./links/ ~;
	source ~/.zshrc;
}

echo "Step1: Sync all dotfiles to ~/"

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
