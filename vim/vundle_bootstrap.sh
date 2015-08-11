#!/usr/bin/env bash

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim -u $HOME/.vim/vimrc/plugins.vim +PluginInstall +qall
