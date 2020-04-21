" Scripts comuns a todos filetypes de javascript, como typescript e javascript
" react. Para ver se o arquivo está sendo carregado use :scriptnames

inorea <buffer> log <esc>:call TestaTriggerSnippet('log', 'SnippetJsLog')<cr>
inorea <buffer> if <esc>:call TestaTriggerSnippet('if', 'SnippetJsIf')<cr>
inorea <buffer> fun <esc>:call TestaTriggerSnippet('fun', 'SnippetJsFunction')<cr>
inorea <buffer> ed <esc>:call TestaTriggerSnippet('ed', 'SnippetJsExportDefault')<cr>
inorea <buffer> im <esc>:call TestaTriggerSnippet('ed', 'SnippetJsImportFrom')<cr>

" DICAS:
" normal! ... executa literalmente tudo ignorando abreviações e maps
" execute "normal! ..." interpresa \<esc>\<cr>
" startinsert entra em modo insert (i) e continua
" startinsert! entra em modo insert (a) e continua
" call feedkeys(...) interpreta como se o usuário fizess o comando
"   pode continuar em modo de inser por exemplo

" PRATICAS:
" 1. Após a primeira linha colocar ==
" 2. Pensar nas instruções como se fossem comandos do vim
"   - cada "normal!" é realizado um <esc> e vai para o próximo comando
" 3. Sempre terminar com startinsert, startinsert! ou call feedkeys('')
"   - feedkeys('S'), feedkeys('O'), feedkeys('o'), feedkeys('A') ...

fun! SnippetJsIf()
    normal! aif() {
    normal! 2hms
    normal! o<++>
    normal! o}
    normal! `s
    startinsert
endfun

fun! SnippetJsLog()
    normal! aconsole.log()
    normal! ==A
    startinsert
endfun

fun! SnippetJsFunction()
    normal! afunction (<++>) {
    normal! 7hms
    normal! o<++>
    normal! o}
    normal! `s
    startinsert
endfun

fun! SnippetJsExportDefault()
    normal! aexport default x
    call feedkeys('s')
endfun

fun! SnippetJsImportFrom()
    normal! aimport <++> from ''
    startinsert
endfun

inoremap <buffer> <c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit
inoremap <buffer> <c-d><c-s> <esc>bi<<esc>ea/><esc>
inoremap <buffer> <c-d><c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit<cr><esc>O
