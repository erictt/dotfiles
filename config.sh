#!/usr/bin/env bash

# run brew.sh at first
if [[ -d ~/.config ]]
then
    echo "~/.config exists, please move it at first"
    mv ~/.config ~/.config.bak
    exit 1
fi

# create alias to .config
ln -sf ~/workspace/projects/dotfiles/config ~/.config

# ---------------------------------------- vim --------------------------------------- #
BASEDIR="$(dirname "${BASH_SOURCE}")"
cd $BASEDIR
CURRENT_DIR=`pwd`

nvim --headless +qa

brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

# Patch fonts with a high number of glyphs (icons). 
# Don't forget to install the font:
#   https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
# ---------------------------------------- vim ---------------------------------------- #

# ---------------------------------------- zsh ---------------------------------------- #
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download antigen
mkdir -p ~/.config/
curl -L git.io/antigen > ~/.config/antigen.zsh

rm -rf ~/.zshrc ~/.zsh
ln -sf ~/workspace/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/workspace/dotfiles/zsh/.zsh ~/.zsh
ln -sf ~/workspace/dotfiles/zsh/.antigenrc ~/.antigenrc

# rsync	--exclude ".DS_Store" \
#   --exclude ".osx" \
#   --exclude "themes/" \
#   -avh --no-perms ./zsh/ ~;
# copy the theme
cp -f ./zsh/themes/hyperzsh.zsh-theme ~/.oh-my-zsh/custom/themes/hyperzsh.zsh-theme
source ~/.zshrc;
# ---------------------------------------- zsh ---------------------------------------- #

# ---------------------------------------- tmux ---------------------------------------- #
if [[ -d ~/.tmux.conf ]]
then
    echo "~/.tmux.conf exists, moved it to ~/.tmux.conf.bak"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -sf ~/workspace/projects/dotfiles/tmux ~/.tmux.conf
# ---------------------------------------- tmux ---------------------------------------- #
