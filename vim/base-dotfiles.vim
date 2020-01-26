"# Base dotfiles
" Arquivo complementar ao base.vim e total dependente do repo dotfiles
"
"## Dicionários
"set complete+=k
let g:dict_dir = "~/dev/dotfiles/vim/dicionarios/"

"## Snippets
" :ia
highlight link NeniTagJump DiffAdd
match NeniTagJump /<++>/

function JumpToTag()
    " search retorna a linha onde o parametro foi encontrado
    if search("<++>",'nw') > 0
        " posiciona o cursor sob o padrão da marcação
        call search("<++>",'w')
        " Caso a marcação esteja na ultima coluna da linha, o :startinsert
        " recua uma coluna a mais. Como seria muito complexo calcular essa
        " situação, é mais fácil entrar no modo de insert e apagar o numero
        " de letras (4 para <++>)
        call feedkeys("i\<del>\<del>\<del>\<del>")
    endif
endfun
inoremap <c-tab> <esc>:call JumpToTag()<cr>
nnoremap <c-tab> <esc>:call JumpToTag()<cr>

" Cancela autotrigger snippet com qualquer "non-keyword"
" Créditos: https://stackoverflow.com/questions/36702371/understand-iabbrev-buffer-iff-ifleft
function LeSnippet(root, file)
    let c = nr2char(getchar(0))
    if c == "\<tab>"
        " Assim que a função é chamada o modo é trocado do insert pro normal
        " deslocando o cursor para a direita. Caso não esteja na primeira
        " coluna, ele não se move, afetando a escolha entre i (insert) e a
        " (apend)
        if col(".") == 1
            " Coloca dois marcadores (§):
            " O primeiro demarca o final da linha [l1] (inicio do snippet) e o
            " segundo o inicio da ultima linha [l2] (final do snippet)
            execute "normal i§§"
        else
            " Coloca dois marcadores (§):
            " O primeiro demarca o final da linha [l1] (inicio do snippet) e o
            " segundo o inicio da ultima linha [l2] (final do snippet)
            execute "normal a§§"
        endif
        " Acessa entre os marcadores (§§) e da um enter para quebrar a linha.
        " O marcador preservará o espaço contido antes e depois do mesmo,
        " evitando que o J crie um espaço caso não precise ou unifique caso ja
        " exista
        execute "normal i\<cr>"

        " Marca l2 (mark s) e sobe para a linha inicial
        normal msk

        " Escreve o conteudo do snippet logo abaixo da linha inicial
        execute "read" . a:file

        " - Marca a primeira linha do snippet lido (mark d)
        " - Unifica l1 com a primeira do snippet
        " - Move para esquerda e apaga o espaço gerado pelo J e o marcador (§)
        " - Retorna à l2
        " - Unifica l2 com a ultima do snippet
        " - Apaga o espaço gerado pelo J e o marcador (§) restante
        " - Seleciona de l2 unificada até l1 unificada com o snippet e identa
        normal mdkJhxx`skJxxV`d=
        call JumpToTag()
    elseif c == " " || c == '.' || c == ',' || c == ';'
        " a:root . c vai tornar recursiva a função.
        " É necessário colocar uma letra que não seja non-keyword para depois
        " apagá-la
        execute "normal i" . a:root . 'c' . c
        execute "normal hx"
        startinsert
        call cursor( line('.'), col('.') + 1)
    else
        " a:root . c vai tornar recursiva a função.
        " É necessário colocar uma letra que não seja non-keyword para depois
        " apagá-la
        execute "normal i" . a:root . 'a'
        execute "normal x"
    endif
endfunction

function! CriaSnippet(root, good)
    execute "iabbr <buffer> " . a:root . " <esc>:call LeSnippet(\"" . a:root . "\", \"" . a:good . "\")<cr>"
endfunction

function! RegistraArraySnippets(snippet)
    for key in keys(a:snippet)
        execute CriaSnippet(key, a:snippet[key])
    endfor
endfunction

let s:snippetsDir = '~/dev/dotfiles/vim/snippets/'
let s:snippetsDirPHP = s:snippetsDir . 'php/'
let s:snippets_php_abbreviations = {
            \ 'for': s:snippetsDirPHP.'for.php',
            \ 'fore': s:snippetsDirPHP.'foreach.php',
            \ 'fun': s:snippetsDirPHP.'function.php',
            \ 'if': s:snippetsDirPHP.'if.php',
            \ '-': s:snippetsDirPHP.'private.php',
            \ '#': s:snippetsDirPHP.'protected.php',
            \ '+': s:snippetsDirPHP.'public.php',
            \ 't': s:snippetsDirPHP.'this.php',
            \ 'dd': s:snippetsDirPHP.'var_dump.php',
            \ 'e': s:snippetsDirPHP.'echo.php',
            \ }
let s:snippetsDirJS = s:snippetsDir . 'js/'
let s:snippets_js_abbreviations = {
            \ 'for': s:snippetsDirJS.'for.js',
            \ 'fun': s:snippetsDirJS.'function.js',
            \ 'if': s:snippetsDirJS.'if.js',
            \ 'log': s:snippetsDirJS.'log.js',
            \ }

au FileType php call RegistraArraySnippets(s:snippets_php_abbreviations)
au FileType javascript call RegistraArraySnippets(s:snippets_js_abbreviations)
au FileType html call RegistraArraySnippets(s:snippets_js_abbreviations)


"# Linguagens de programação
"## HTML
augroup html
    au BufNewFile *.html 0r ~/dev/dotfiles/vim/skeletons/skeleton.html
"    au FileType html :so ~/dev/dotfiles/vim/plugins/matchit.vim
augroup END
"## PHP
augroup php
    au BufNewFile *.php 0r ~/dev/dotfiles/vim/skeletons/skeleton.php
    au BufNewFile phpunit.xml 0r ~/dev/dotfiles/vim/skeletons/phpunit.xml
    au FileType php nmap <leader>r :terminal php %<CR>

    " Dicionarios (c-x c-k) pois o ctags ainda é meio bugado
    let dict_phpunit = g:dict_dir . "phpunit.txt"
    au BufRead *test.php execute "setlocal dictionary+=".dict_phpunit
augroup END
"## SHELL
"augroup sh
"    au BufNewFile *.sh 0r ~/dev/dotfiles/vim/skeletons/skeleton.sh
"augroup END