" Golang:
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 1
"let g:go_highlight_fields = 1
let g:go_auto_sameids = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
nmap <silent> <leader> gg <Plug>(coc-definition)

" Python:
let g:pymode_options_max_line_length=100
autocmd FileType python set colorcolumn=120

" Yankring:
let g:yankring_history_dir = $HOME.'/.vim/'


" Arduino:
let g:vim_arduino_library_path ="/usr/share/arduino"


" Minibuffer: plugin
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 30
let g:miniBufExplSplitBelow=1
autocmd BufRead,BufNew :call UMiniBufExplorer
map <leader>u :TMiniBufExplorer<cr>


" CtrlP:
map <leader>t :CtrlP<CR>
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


" NERDTree:
map <F5> :NERDTreeToggle<cr>
map <leader><leader> :NERDTreeToggle<cr>
let NERDTreeHighlightCursorline = 0

" Omnicomplete:
set completeopt=longest,menuone


" Cope:
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


" BufExplorer:
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


" GitGutter:
" Sign Column made by solarized color is strange, clear it.
"highlight clear SignColumn
" vim-gitgutter will use Sign Column to set its color, reload it.
"call gitgutter#highlight#define_highlights()
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" VimMarkdown:
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['go', 'coffee', 'css', 'erb=eruby', 'python', 'java', 'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']


" Fugitive:
map <leader>gs :Git<cr>
set diffopt+=vertical

" YouCompleteMe:
let g:ycm_filetype_whitelist = { 'go': 1 }

" Deoplete:
let g:deoplete#enable_at_startup = 1

" VimInstantMarkdown:
let g:instant_markdown_autostart = 0

" Cpp:
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

" Ale:
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" UndoTree:
map <F4> :UndotreeToggle<cr>


if has_key(plugs, "coc.nvim")
  " CoC:
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
  " remap for complete to use tab and <cr>
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <c-space> coc#refresh()

  hi CocSearch ctermfg=12 guifg=#18A3FF
  hi CocMenuSel ctermbg=109 guibg=#13354A

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
endif

set completeopt=menu,menuone,noselect

