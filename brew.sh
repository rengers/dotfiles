#!/usr/bin/env bash

source $HOME/dotfiles/platforms.sh
is_osx || echo "Not OSX. Skipping brew install" && exit 0

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install cmake
brew install cmake

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install other useful binaries.
brew install zsh
brew install python
brew install python3
brew install direnv
brew install fzf
brew install go --cross-compile-common
brew install mercurial
brew install ack
brew install bzr
brew install git
brew install tig
brew install iftop
brew install jq
brew install rbenv
brew install ruby-build
brew install htop
brew install tree
brew install gpg
brew install pigz
brew install wget
brew install aria2
brew install watch
brew install fasd
brew install nmap
brew install ag
brew install tcptraceroute
brew install ctags

# Install cask and programs
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install firefox
brew cask install alfred
brew cask install amethyst
brew cask install bettertouchtool
brew cask install spotify
brew cask install adobe-reader
brew cask install seil
brew cask install android-file-transfer
brew cask install growlnotify
brew cask install iterm2
brew cask install vlc
brew cask install menumeters
brew cask install gpgtools
brew cask install xquartz
brew cask install colloquy
brew cask install skype

#cleanup cask
brew cask cleanup

# Remove outdated versions from the cellar.
brew cleanup
