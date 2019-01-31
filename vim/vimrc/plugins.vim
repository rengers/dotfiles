" Where all the plugins are specified, using Vundle
" Initialize vundle!
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" ----------------------------
" Plugins, managed by Vundle!
" ----------------------------
" Use to manage plugins!
Bundle 'gmarik/vundle'


" ----------------
" --- Movement ---
" ----------------
" Easier vim motions. Try <Leader><Leader>w or <Leader><Leader>fo
Bundle 'Lokaltog/vim-easymotion'
" Like Command-T or fuzzyfinder. Use to fuzzy find files
Bundle 'kien/ctrlp.vim'


" -----------------------
" --- UI enhancements ---
" -----------------------
" Highlight levels of indentation
Bundle 'nathanaelkane/vim-indent-guides'
" File explorer within Vim
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Ultimate Vim statusline utility
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
" Highlights the matching HTML tag
Bundle 'gregsexton/MatchTag'
" Rainbow parentheses!! :)
Bundle 'kien/rainbow_parentheses.vim'


" ------------------------
" --- Vim enhancements ---
" ------------------------
" Shows 'Nth match out of M' for searches
Bundle 'IndexedSearch'
" Allow tab completion when searching
Bundle 'SearchComplete'
" Simple plugin to view most recently used files
Bundle 'mru.vim'
Bundle 'bufexplorer.zip'
Bundle 'airblade/vim-gitgutter'


" ----------------------------
" --- Editing enhancements ---
" ----------------------------
" Shortcuts to comment code. Use <Leader>cc or <Leader>c<Space>
Bundle 'scrooloose/nerdcommenter'

" Simple shortcuts to deal with surrounding symbols
Bundle 'tpope/vim-surround'

" Text filtering and alignment
Bundle 'godlygeek/tabular'

" Insert-mode autocompletion for quotes, parens, brackets, etc.
Bundle 'Raimondi/delimitMate'

" Syntax checking in Vim!
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'matchit.zip'
Bundle 'mattn/emmet-vim'
if has('nvim')
  Bundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Bundle 'zchee/deoplete-go'
  Bundle 'equalsraf/neovim-gui-shim'
else
  Bundle 'Valloric/YouCompleteMe'
endif

" Preview markdown
"Bundle 'suan/vim-instant-markdown'


" snipMate
Bundle 'garbas/vim-snipmate'

" snipMate dependences
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'scrooloose/snipmate-snippets'

" Language support
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'noprompt/vim-yardoc'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'vimoutliner/vimoutliner'
Bundle 'wannesm/wmgraphviz.vim'
Bundle 'omlet.vim'
Bundle 'jcf/vim-latex'
Bundle 'vim-scripts/haskell.vim'
Bundle 'spf13/PIV'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'
Bundle 'klen/python-mode'
Bundle 'django.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-salve'
Bundle 'fatih/vim-go'
Bundle 'mdempsky/gocode'
Bundle 'kingbin/vim-arduino'
Bundle 'sudar/vim-arduino-syntax'
Bundle 'solarnz/thrift.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'hashivim/vim-terraform'
Bundle 'rodjek/vim-puppet'
Bundle 'empanda/vim-varnish'
Bundle 'chase/vim-ansible-yaml'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'rust-lang/rust.vim'
Bundle 'cespare/vim-toml'
Bundle 'mxw/vim-jsx'

" Vim Text Objects
Bundle 'bkad/CamelCaseMotion'

" Integrations
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-classpath'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'
Bundle 'lifepillar/vim-solarized8'

" Utilities, Dependencies
Bundle 'L9'
