#!/usr/bin/env bash
set -e

source $HOME/dotfiles/platforms.sh
is_osx || (echo "Not OSX. Skipping brew install" && exit 0)

# Install homebrew
if [ ! -f /usr/local/bin/brew ]
then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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

# Install brew casks
brew cask install google-chrome --force
brew cask install firefox --force
brew cask install alfred --force
brew cask install amethyst --force
brew cask install bettertouchtool --force
brew cask install spotify --force
brew cask install adobe-acrobat-reader --force
brew cask install karabiner-elements --force
brew cask install android-file-transfer --force
brew cask install growlnotify --force
brew cask install iterm2 --force
brew cask install vlc --force
brew cask install gpg-suite --force
brew cask install colloquy --force
brew cask install skype --force
brew cask install java --force

# Remove outdated versions from the cellar.
brew cleanup
