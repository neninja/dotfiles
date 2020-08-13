function! FoldMethodTodoList()
    if getline(v:lnum) =~ '^- .*$'
        return ">1"
    else
        return "="
    endif
endfunction

nmap <silent><buffer> > :call SwapToggle('>')<CR>
nmap <silent><buffer> < :call SwapToggle('<')<CR>

setlocal foldmethod=expr
setlocal foldexpr=FoldMethodTodoList()
setlocal foldtext=FoldTextTodoList()

function! SwapToggle(direction)
    try
        normal! zc
    catch
        return
    endtry
    normal! dd

    if(a:direction == '>')
        exec "normal! \<c-w>\<c-l>G"
    else
        exec "normal! \<c-w>\<c-h>G"
    endif

    " THANKS: https://stackoverflow.com/a/49578026/9881278
    let emptyline = getline('.') !~ '[^\s]'

    if(emptyline)
        norm Vp
    else
        norm p
    endif

    wa
endfunction

function! FoldTextTodoList()
    let char = get({ 'TODO': '?', 'DOING': '!' , 'DONE': 'x', 'default': '=' }, expand('%:t'), 'TODO')

    " :h digraph-table-mbyte
    let foldchar = matchstr(&fillchars, 'fold:\zs.')

    let foldtextstart = substitute(getline(v:foldstart),"-",char,'')

    return foldtextstart  . ' ' . repeat(foldchar, winwidth(0))
endfunction
