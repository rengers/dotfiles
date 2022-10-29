"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax enable "Willl use treesitter for now

"Ross font
set gfn=Monaco\ 9

set number
let g:solarized_termtrans=1
"colorscheme solarized8
"colorscheme material

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

set cursorline

" Hide the text below status line
set noshowmode

set foldlevel=99

" Highlight trailing space 
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Illuminate highlight config
hi def IlluminatedWordText cterm=underline gui=underline
hi def IlluminatedWordRead cterm=underline gui=underline
hi def IlluminatedWordWrite cterm=underline gui=underline
