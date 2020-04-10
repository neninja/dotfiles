inorea <buffer> log <esc>:call TestaTriggerSnippet('log', 'SnippetJsLog')<cr>
inorea <buffer> if <esc>:call TestaTriggerSnippet('if', 'SnippetJsIf')<cr>
inorea <buffer> fun <esc>:call TestaTriggerSnippet('fun', 'SnippetJsFunction')<cr>

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
    normal! iif(){
    normal! ==
    normal! o<++>
    normal! o}
    normal! 2k3l
    startinsert
endfun

fun! SnippetJsLog()
    normal! aconsole.log()
    normal! ==A
    startinsert
endfun

fun! SnippetJsFunction()
    normal! ifunction (<++>){
    normal! ==
    normal! o<++>
    normal! o}
    normal! 2k9l
    startinsert
endfun
