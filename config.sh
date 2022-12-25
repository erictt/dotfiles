#!/usr/bin/env bash

# run brew.sh at first
if [[ -d ~/.config ]]
then
    echo "$HOME/.config exists, please move it at first"
    mv ~/.config ~/.config.bak
    exit 1
fi

# create alias to .config
ln -sf ~/workspace/projects/dotfiles/.config ~/.config

# ---------------------------------------- vim --------------------------------------- #
BASEDIR="$(dirname "${BASH_SOURCE[0]}")"
cd "$BASEDIR" || exit

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
curl -L git.io/antigen > ~/.config/antigen.zsh

rm -rf ~/.zshrc ~/.zsh ~/.antigenrc
ln -sf ~/workspace/projects/dotfiles/.zshrc ~/.zshrc
ln -sf ~/workspace/projects/dotfiles/.zsh ~/.zsh
ln -sf ~/workspace/projects/dotfiles/.antigenrc ~/.antigenrc

source "$HOME/.zshrc"
# ---------------------------------------- zsh ---------------------------------------- #

# ---------------------------------------- tmux ---------------------------------------- #
if [[ -d ~/.tmux.conf ]]
then
    echo "$HOME/.tmux.conf exists, moved it to $HOME/.tmux.conf.bak"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -sf ~/workspace/projects/dotfiles/.tmux.conf ~/.tmux.conf
# Install tpm: 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ---------------------------------------- tmux ---------------------------------------- #
cat ./NOTE.md
