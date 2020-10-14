setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=81 " usar Vgq é util para quebrar linhas
setlocal norelativenumber nonumber

" Permite trocar de window pelo nome do buffer com :sb
" THANKS: https://stackoverflow.com/a/9440501/9881278
setlocal switchbuf=useopen

"## Maps
nnoremap <silent><buffer>   =           :silent! call <SID>DoneTask()<CR>
nnoremap <silent><buffer>   <CR>        :call <SID>HandleURL()<CR>
nnoremap <buffer>           <c-space>   :call ToggleCheckbox()<CR>

function! s:DoneTask()
    try
        normal! zc
    catch
        return
    endtry

    normal! V"sx
    execute "e ".g:todolist_dir."/DONE"

    call <SID>AddTaskFirstLine()

    w
    b #
    w
endfunction

function! s:SwapTask(wcmd)
    try
        normal! zc
    catch
        return
    endtry

    normal! V"sx
    execute "wincmd ".a:wcmd

    call <SID>AddTaskFirstLine()

    wa
endfunction

function! s:AddTaskFirstLine()
    normal! gg

    " THANKS: https://stackoverflow.com/a/49578026/9881278
    let emptyline = getline('.') !~ '[^\s]'

    if(emptyline)
        norm V"sp
    else
        norm "sP
    endif
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

"# Fold
setlocal foldmethod=expr
setlocal foldexpr=FoldMethodTodoList()
setlocal foldtext=FoldTodoText()

function! FoldTodoText()
    let lines_count = v:foldend - v:foldstart + 1

    " :h digraph-table-mbyte
    let lines_count_text = '┤' . printf("%4s", lines_count) . '├'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')

    let titulo = getline(v:foldstart)

    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(titulo . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return titulo  . ' ' . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

function! FoldMethodTodoList()
    if getline(v:lnum) =~ '^\S.*$'
        return ">1"
    else
        return "="
    endif
endfunction
