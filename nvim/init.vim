 set runtimepath^=~/.vim runtimepath+=~/.vim/after
 let &packpath = &runtimepath
 source ~/.vimrc


 lua require("rengers")
 "source ~/.config/nvim/after_init.lua
