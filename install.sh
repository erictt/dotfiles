#!/usr/bin/env bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install other useful binaries.
brew install wget
brew install cmake
brew install make
brew install neovim
brew install ack
brew install git
brew install git-secret
brew install imagemagick
brew install rename
brew install ssh-copy-id
brew install tree
brew install vbindiff

# Install languages
brew install python3
brew install node
brew install php

# Install Terminal tools.
brew install zsh
brew install tmux
brew install neovim
brew install kitty

# Switch to zsh as default shell
if ! fgrep -q '/bin/zsh' /etc/shells; then
  echo '/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /bin/zsh;
fi;

# Install Apps
brew install iterm2
brew install alfred
# brew cask install flycut
brew install spectacle

# Remove outdated versions from the cellar.
brew cleanup