" Ross vimrc
"
set nocompatible
behave xterm
filetype off
filetype plugin indent on
source $HOME/.vim/vimrc/functions.vim
source $HOME/.vim/vimrc/settings.vim

" Source a local vimrc if it exists
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif
