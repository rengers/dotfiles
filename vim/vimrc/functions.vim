func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc


func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


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


"Git branch
function! GitBranch()
  try
    let branch = exists('g:loaded_fugitive') ? substitute(fugitive#statusline(), '\[Git(\([a-z0-9\-_\./:]\+\))\]', '\1', 'gi') : ''
  catch
    return ''
  endtry
  if branch !=''
    return 'Branch:'.branch.''
  en

  return ''
endfunction


function! CurDir()
    return substitute(getcwd(), "$HOME/", "~/", "g")
endfunction


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"
" From an idea by Michael Naumann
" 
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 


function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

nmap =j :%!python -m json.tool<CR>
