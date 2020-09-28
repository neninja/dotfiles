setlocal foldmethod=expr
setlocal foldexpr=FoldMethodTodoList()
setlocal foldtext=FoldTodoText()
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=81 " usar Vgq é util para quebrar linhas

"## Syntax
highlight Folded guifg=#5f5fd7 guibg=NONE ctermfg=62 ctermbg=NONE term=bold gui=bold

" THANKS: http://vimregex.com/
syn match todoListCardTitle /^\S.*$/ containedin=ALL
syn match todoListCardBody /^\s.*$/ containedin=ALL

syn match todoListBegginingList /^\s*-/ contained containedin=todoListCardBody
syn match todoListBegginingCheckbox /^\s*-\s\[\p\]/ contained containedin=todoListCardBody
syn match todoListURL /[http|https]*:\/\/[^ >,;]*/ contained containedin=todoListCardBody

syn match Conceal /^\s.*$/ containedin=ALL
syn match todoListBullet /-/ contained containedin=todoListBegginingList conceal cchar=•
syn match todoListItemCheckbox /-\s\[\p\]/ contained containedin=todoListBegginingCheckbox conceal
syn match todoListCheckbox /\[\p\]/ contained containedin=todoListItemCheckbox
syn match todoListCheck /\s/ contained containedin=todoListCheckbox conceal cchar=□
syn match todoListEmptyCheck /x/ contained containedin=todoListCheckbox conceal cchar=✓

hi link todoListCardTitle Todo
hi link todoListCardBody PreProc
hi link todoListBullet todoListCardBody

hi clear Conceal
hi link Conceal todoListCardBody

" mantem conceal
set concealcursor=nv

"## Maps
nmap <silent><buffer> -     :call <SID>SwapTask()<CR>
nmap <silent><buffer> =     :call <SID>DoneTask()<CR>
nmap <silent><buffer> <CR>  :call <SID>HandleURL()<CR>
nnoremap <buffer> <c-space> :call ToggleCheckbox()<CR>

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

function! s:SwapTask()
    try
        normal! zc
    catch
        return
    endtry

    normal! V"sx
    wincmd w

    call <SID>AddTaskFirstLine()

    wa
endfunction

function! s:DoneTask()
    try
        normal! zc
    catch
        return
    endtry

    normal! V"sx
    tabn
    wincmd h

    call <SID>AddTaskFirstLine()

    tabn
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

