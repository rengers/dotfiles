" Syntastic:
map <leader>st :SyntasticToggleMode<cr>
" Only show errors not warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}


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