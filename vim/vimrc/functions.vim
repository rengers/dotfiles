
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nnoremap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>c :call ToggleList("Quickfix List", 'c')<CR>

nnoremap =j :%!python -m json.tool<CR>


function! StartProfiling()
  execute "profile start profile.log"
  execute "profile func *"
  execute "profile file *"
endfunction


" Profiling
"nnoremap <silent> <leader>ps :exe ":profile start profile.log"<CR> :exe ":profile func *"<CR> :exe ":profile file *"<CR>
nnoremap <silent> <leader>s :call StartProfiling()<CR>
nnoremap <silent> <leader>ss :exe ":profile pause"<cr>:noautocmd qall!<cr>

