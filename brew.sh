#!/usr/bin/env bash
set -x

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

# Install all brews and casks from Brewfile
brew bundle
