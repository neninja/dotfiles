" retorna título dos folds padrão markdown
" THANKS: https://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! FoldTextMarkdown()
  let lines_count = v:foldend - v:foldstart + 1

  " :h digraph-table-mbyte
  let lines_count_text = '┤' . printf("%4s", lines_count) . '├'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')

  " remove hashtags
  " let titulo = substitute(getline(v:foldstart),"\#","",'g')
  let titulo = substitute(getline(v:foldstart),"\#","+",'g')

  " cria + de acordo com # (foldlevel)
  " let foldtextstart = repeat('+', v:foldlevel + 1) . titulo
  let foldtextstart = titulo

  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart  . ' ' . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

function! FoldMethodMarkdown()
    if getline(v:lnum) =~ '^## .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">5"
    endif
    return "=" 
endfunction

setlocal foldmethod=expr
setlocal foldexpr=FoldMethodMarkdown()  
setlocal foldtext=FoldTextMarkdown()
":lvimgrep /^"#/ % | lw

setlocal spell

function! ToggleCheckbox()
    normal! ms0
    if(search('-\s\[\p\]', 'c', line('.')))
        if(getline('.')[col('.') + 2] == ' ')
            normal! 3lrx
        else
            exec "normal! 3lr "
        endif
    else
        if(search('^.*-\s', 'c', line('.')))
            exec "normal! ^la[ ] "
        else
            exec "normal! I- [ ] "
        endif
    endif
    normal `s
endfunction

nnoremap <buffer> <c-space> :call ToggleCheckbox()<CR>
