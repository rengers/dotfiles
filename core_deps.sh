#!/usr/bin/env bash

source $HOME/dotfiles/platforms.sh

if is_alinux || is_rhel
then
  # Keep-alive: update existing `sudo` time stamp until the script has finished.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  sudo yum update -y
  sudo yum install -y python26
  sudo yum install -y python27
  sudo yum install -y git
  sudo yum install -y vim
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

if is_ubuntu
then
  # Keep-alive: update existing `sudo` time stamp until the script has finished.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  sudo apt-get install python2.7
  sudo apt-get install rbenv
fi
