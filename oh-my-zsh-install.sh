#!/usr/bin/env bash

if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo "Installing Ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
