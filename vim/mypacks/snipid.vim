" Snippets feitos da maneira mais simples, porém útil, possível
"
" Exemplo:
"
" inoreabbrev <expr> snip TestaTriggerSnippet('snip',
"             \ "snip(let i=0;x > 10;x++){<cr>/* codigo */<cr>}",
"             \ ['let i=0', 'x > 10', 'x++', '\/\* codigo \*\/'])
"
" snip<space>

let g:nonkw_snippet_trigger = "\<tab>"

function! TestaTriggerSnippet(abbr, expansion, placeholders)
    let g:placeholders = a:placeholders
    let s:expansion = a:expansion.
                \ "\<Esc>:call PlaceHolder('?')\<CR>"
            " \ "\<Esc>g_"
            " \ "\<C-R>=Eatchar('\s')\<CR>"
    let c = nr2char(getchar(0))
    if c == g:nonkw_snippet_trigger
        return s:expansion
    else
        return a:abbr . c
    endif
endfunction

inoremap <c-j> <ESC>:call PlaceHolder('/')<CR>
snoremap <c-j> <ESC>:call PlaceHolder('/')<CR>
snoremap <bs>  i<bs>

" TODO tornar stateless
let g:placeholders = []
function! PlaceHolder(backward)
    if get(g:placeholders, 0, '0') != '0'
        if search(g:placeholders[0], 'nw')>0
            let placeholder = g:placeholders[0]
            unlet g:placeholders[0]

            if get(g:placeholders, 0, '0') != '0'
                highlight link NeniSnippetPlaceHolder DiffAdd
                execute 'match NeniSnippetPlaceHolder /'.g:placeholders[0].'/'
            else
                execute "match NeniSnippetPlaceHolder //"
            endif

            execute "normal! ".a:backward.placeholder."\<cr>"
            execute "normal! gn\<c-g>"
        else
            execute "normal! a".g:placeholders
        endif
    endif
endfunction

inorea <buffer><expr> filen TestaTriggerSnippet('filen',
            \ "<C-R>=expand('%:t:r')<CR>",
            \ [])

