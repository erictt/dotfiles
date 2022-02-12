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
# Install Bash 5.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install zsh
brew install tmux

# brew install neovim
brew install macvim


# Switch to zsh as default shell
if ! fgrep -q '/bin/zsh' /etc/shells; then
  echo '/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /bin/zsh;
fi;

# Install `wget`
brew install wget

# Install more recent versions of some macOS tools.
brew install cmake
# brew install macvim

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-secret
brew install imagemagick
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli

brew install python

# Install Apps
brew install iterm2
brew install sourcetree
brew install alfred
# brew cask install flycut
brew install spectacle

brew install iina
# brew cask install skype

# Remove outdated versions from the cellar.
brew cleanup
