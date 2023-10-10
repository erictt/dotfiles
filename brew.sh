#!/usr/bin/env bash

# Install homebrew
export HOMEBREW_NO_INSTALL_FROM_API=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# brew install coreutils

# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils

# Install other useful binaries.
brew install wget
# brew install cmake
# brew install make
brew install ack
brew install bat  # replace cat
brew install btop # top-like system monitor
brew install exa  # replace ls
brew install fd   # faster file search, also used by neo-tree
brew install fzf  # fuzzy search on command-line
brew install git
brew install git-secret
# brew install imagemagick
brew install rename
brew install ripgrep # replace grep
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install shfmt

# Install languages
brew install python3
brew install node
brew install typescript
# brew install php

# Install Terminal tools.
brew install zsh
# brew install fish
brew install tmux
brew install neovim
brew install lazygit

# Switch to zsh as default shell
if ! grep -qF '/bin/zsh' /etc/shells; then
	echo '/bin/zsh' | sudo tee -a /etc/shells
	chsh -s /bin/zsh
fi

# Install Apps
brew install kitty
# brew install alfred
brew install kitty
# brew cask install flycut
brew install spectacle

# for vim
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
brew install cppcheck # for null-ls

# Patch fonts with a high number of glyphs (icons).
# Don't forget to install the font:
#   https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Remove outdated versions from the cellar.
brew cleanup
