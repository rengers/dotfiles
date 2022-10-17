" Configuration for specific filetypes go here

" Enable filetype plugin
filetype plugin on
filetype indent on

au BufReadPost fugitive://* set bufhidden=delete

" Always reset the cursor when editing commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufWritePost *.go silent! !ctags -R &

" Turn on spelling for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell


" vim -b : edit binary using xxd-format!
"augroup Binary
"  au!
"  au BufReadPre  *.bin let &bin=1
"  au BufReadPost *.bin if &bin | %!xxd
"  au BufReadPost *.bin set ft=xxd | endif
"  au BufWritePre *.bin if &bin | %!xxd -r
"  au BufWritePre *.bin endif
"  au BufWritePost *.bin if &bin | %!xxd
"  au BufWritePost *.bin set nomod | endif
"augroup END
