" Where all the plugins are specified, using Vundle
" Initialize vundle!
set nocompatible
call plug#begin()

" ----------------------------
" Plugins, managed by Vundle!
" ----------------------------
" Use to manage plugins!
Plug 'gmarik/vundle'


" ----------------
" --- Movement ---
" ----------------
" Easier vim motions. Try <Leader><Leader>w or <Leader><Leader>fo
Plug 'Lokaltog/vim-easymotion'
" Like Command-T or fuzzyfinder. Use to fuzzy find files
Plug 'kien/ctrlp.vim'


" -----------------------
" --- UI enhancements ---
" -----------------------
" Highlight levels of indentation
Plug 'nathanaelkane/vim-indent-guides'
" File explorer within Vim
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Ultimate Vim statusline utility
"Plug 'Lokaltog/vim-powerline'
Plug 'bling/vim-airline'
" Highlights the matching HTML tag
Plug 'gregsexton/MatchTag'
" Rainbow parentheses!! :)
Plug 'kien/rainbow_parentheses.vim'

Plug 'ryanoasis/vim-devicons'

" ------------------------
" --- Vim enhancements ---
" ------------------------
" Shows 'Nth match out of M' for searches
Plug 'henrik/vim-indexed-search'
" Allow tab completion when searching
Plug 'vim-scripts/SearchComplete'
" Simple plugin to view most recently used files
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'


" ----------------------------
" --- Editing enhancements ---
" ----------------------------
" Shortcuts to comment code. Use <Leader>cc or <Leader>c<Space>
Plug 'scrooloose/nerdcommenter'

" Simple shortcuts to deal with surrounding symbols
Plug 'tpope/vim-surround'

" Text filtering and alignment
Plug 'godlygeek/tabular'

" Insert-mode autocompletion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" Syntax checking in Vim!
" Plug 'scrooloose/syntastic' " Use ale instead
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

  Plug 'equalsraf/neovim-gui-shim'
else
 "Plug 'Valloric/YouCompleteMe'
endif
Plug 'w0rp/ale'

" snipMate
"Plug 'garbas/vim-snipmate'
"Plug 'SirVer/ultisnips'

" snipMate dependences
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"Plug 'scrooloose/snipmate-snippets'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'noprompt/vim-yardoc'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'itspriddle/vim-jquery'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'vimoutliner/vimoutliner'
Plug 'wannesm/wmgraphviz.vim'
"Plug 'jcf/vim-latex' - turn on if need latex
Plug 'vim-scripts/haskell.vim'
Plug 'spf13/PIV'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
"Plug 'slim-template/vim-slim' - don't really use slim templates
Plug 'klen/python-mode'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve'
Plug 'fatih/vim-go'
"Plug 'stamblerre/gocode', {'rtp': 'vim/'}
Plug 'kingbin/vim-arduino'
Plug 'sudar/vim-arduino-syntax'
Plug 'solarnz/thrift.vim'
Plug 'junegunn/vim-easy-align'
Plug 'hashivim/vim-terraform'
Plug 'rodjek/vim-puppet'
Plug 'empanda/vim-varnish'
Plug 'chase/vim-ansible-yaml'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Rip-Rip/clang_complete'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'Glench/Vim-Jinja2-Syntax'

" Screenplay formatting
Plug 'kblin/vim-fountain'

Plug 'Shougo/vinarise.vim'

" Vim Text Objects
Plug 'bkad/CamelCaseMotion'

" Integrations
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-classpath'

" Colors
Plug 'altercation/vim-colors-solarized'
"Plug 'sjl/badwolf' - don't use color scheme
Plug 'lifepillar/vim-solarized8'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Utilities, Dependencies
Plug 'vim-scripts/L9'

call plug#end()
