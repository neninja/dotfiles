setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=81 " usar Vgq é util para quebrar linhas

command! -buffer Todo call <SID>TodoneListSearchStatus({'TODO': '\C\<TODO\>'})
command! -buffer Done call <SID>TodoneListSearchStatus({'DONE': '\C\<DONE\>'})
command! -buffer Wait call <SID>TodoneListSearchStatus({'WAIT': '\C\<WAIT\>'})
command! -buffer Note call <SID>TodoneListSearchStatus({'NOTE': '\C\<NOTE\>'})
command! -buffer What call <SID>TodoneListSearchStatus({'????': '????'})

nnoremap <silent><buffer> <CR>      :call <SID>HandleURL()<CR>
nnoremap <silent><buffer> <leader>c :call <SID>TodoneStatusCycling()<CR>

"## Functions
function! s:TodoneListSearchStatus(regex)
    try
        execute "silent lvimgrep /\\(".join(values(a:regex), '\|')."\\)/j %"
        lop
    catch
        redraw
        echohl WarningMsg | echo "Sem ".join(keys(a:regex), ", ") | echohl None
        return
    endtry
    lope
endfunction

function! s:TodoneStatusCycling()
  normal! ms0
  if(search('^\C\<TODO\>', 'c', line('.')))
    normal! ceDONE
  elseif(search('^\C\<DONE\>', 'c', line('.')))
    normal! ceTODO
  elseif(search('^\C\<WAIT\>', 'c', line('.')))
    normal! ceTODO
  elseif(search('^????', 'c', line('.')))
    normal! ceTODO
  elseif(search('^\s*\C\<TODO\>', 'c', line('.')))
    normal! wceDONE
  elseif(search('^\s*\C\<DONE\>', 'c', line('.')))
    normal! wceTODO
  elseif(search('^\s*\C\<WAIT\>', 'c', line('.')))
    normal! wceTODO
  elseif(search('^\s*????', 'c', line('.')))
    normal! wceTODO
  elseif(search('^\s*-', 'c', line('.')))
    normal! wsTODO
  else
    execute "normal! ITODO "
  endif
  normal `s
endfunction

" THANKS: https://stackoverflow.com/a/9459366/9881278
" gx não funcionou no Windows
function! s:HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')

  let g:netrw_browsex_viewer = has('win32') ? "start" : "xdg-open"

  if s:uri != ""
    exec "!".g:netrw_browsex_viewer." ".s:uri
  else
    echo "No URI found in line."
  endif
endfunction

"## Fold
setlocal foldmethod=expr
setlocal foldexpr=FoldMethodTodoneList()
setlocal foldtext=FoldTodoText()

function! FoldTodoText()
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '┤' . printf("%4s", lines_count) . '├'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let titulo = getline(v:foldstart)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(titulo . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return titulo  . ' ' . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

function! FoldMethodTodoneList()
  if getline(v:lnum) =~ '^\S.*$'
    return ">1"
  endif
  return "="
endfunction
