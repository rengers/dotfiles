" Syntastic:
map <leader>st :SyntasticToggleMode<cr>
" Only show errors not warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'gofmt']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': [''] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_puppet_checkers=['puppetlint']

" Golang:
let g:go_fmt_command = "goimports"

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


" Powerline:
let g:Powerline_symbols = 'fancy'
let g:Powerline_dividers_override = ['', '', '', '']
let g:Powerline_symbols_override = { 'BRANCH': '', 'LINE': '', 'RO': '' }


" GitGutter:
" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk]


" VimMarkdown:
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'python', 'java', 'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']


" Fugitive:
map <leader>gs :Gstatus<cr>
set diffopt+=vertical

" YouCompleteMe:
let g:ycm_filetype_whitelist = { 'go': 1 }

" Deoplete:
let g:deoplete#enable_at_startup = 1

" VimInstantMarkdown:
let g:instant_markdown_autostart = 0
