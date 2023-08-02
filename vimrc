" Ross vimrc
"
set nocompatible
behave xterm
filetype off
filetype plugin indent on

" Source a local vimrc if it exists
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif
