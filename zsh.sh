#!/usr/bin/env bash

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
