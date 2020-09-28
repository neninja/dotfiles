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

"## Fake vimwiki
" Replica dos maps do vimwiki

function! s:Navigate()
    normal ms0
    if(search('(\p*)', '', line('.')))
        try
            let save_cwd = getcwd()
            " Esconde erro de tentar sobescrever a função
            " durante a abertura do novo buffer
            silent! normal! lgf
            execute 'cd' fnameescape(save_cwd)
        catch
            normal `s
            return
        endtry
    endif
endfunction

nnoremap <buffer> <c-space> :call ToggleCheckbox()<CR>
nnoremap <buffer> <cr>      :call <SID>Navigate()<CR>
