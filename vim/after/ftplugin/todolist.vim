function! FoldMethodTodoList()
    if getline(v:lnum) =~ '^\S.*$'
        return ">1"
    else
        return "="
    endif
endfunction

nmap <silent><buffer> - :call SwapToggle()<CR>

setlocal foldmethod=expr
setlocal foldexpr=FoldMethodTodoList()
setlocal tabstop=1
setlocal softtabstop=1
setlocal shiftwidth=1
setlocal textwidth=40 " usar Vgq é util para quebrar linhas

function! SwapToggle()
    try
        normal! zc
    catch
        return
    endtry

    exec "normal! dd\<c-w>\<c-w>gg"

    " THANKS: https://stackoverflow.com/a/49578026/9881278
    let emptyline = getline('.') !~ '[^\s]'

    if(emptyline)
        norm Vp
    else
        norm P
    endif

    wa
endfunction

highlight Folded guifg=#5f5fd7 guibg=NONE ctermfg=62 ctermbg=NONE term=bold gui=bold

" THANKS: http://vimregex.com/
syn match todoListCardTitle '^\S.*$' containedin=ALL
syn match todoListCardBody '^\s.*$' containedin=ALL
hi link todoListCardTitle Todo
hi link todoListCardBody PreProc
