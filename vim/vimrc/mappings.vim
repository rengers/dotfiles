" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

"Remap VIM 0
map 0 ^

" Map space to / (search) and c-space to ? (backgwards search)
map <space> :noh<cr>
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
if has('nvim')
  nmap <BS> <C-W>h
endif
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> l
map <left> h

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" Undo and redo in insert mode
inoremap <C-u> <C-o>u
inoremap <C-y> <C-o><C-R>

"Clipper copy paste
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

"Tagbar
nmap <F8> :TagbarToggle<CR>

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Location list
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprev<cr>

" Spell check
noremap <leader>z 1z=

" Live Grep mapping via Telescope
nmap <leader>gg :execute "Telescope live_grep default_text=" . expand("<cword>")<cr>
