" https://vim.fandom.com/wiki/Runtime_syntax_check_for_php
" Para usar o :make % e ver erro de syntax
" compiler php
setl errorformat=%m\ in\ %f\ on\ line\ %l
"THANKS: http://blog.joncairns.com/2012/05/using-vim-as-a-php-ide/
setl makeprg=php\ -l\ %
" THANKS: https://pt.slideshare.net/ZendCon/vim-for-php-programmers-presentation
fun! NN_PHPLint()
    silent make
    if v:shell_error
        copen
    else
        clist
    endif
endfun

fun! NN_PHPExecute()
    !php %
endfun

nnoremap <buffer> <leader>r :terminal php %<CR>

" Map para executar comando de teste do composer
" echo "<?php system('composer test');" > neni-composer-test.php
nnoremap <buffer> <leader>ct :terminal php neni-composer-test.php<CR>

inorea <buffer> dd <esc>:call TestaTriggerSnippet('dd', 'SnippetPhpDieDump')<cr>
inorea <buffer> if <esc>:call TestaTriggerSnippet('if', 'SnippetPhpIf')<cr>
inorea <buffer> fun <esc>:call TestaTriggerSnippet('fun', 'SnippetPhpFunction')<cr>
inorea <buffer> - <esc>:call TestaTriggerSnippet('-', 'SnippetPhpPrivate')<cr>
inorea <buffer> + <esc>:call TestaTriggerSnippet('+', 'SnippetPhpPublic')<cr>
inorea <buffer> # <esc>:call TestaTriggerSnippet('#', 'SnippetPhpProtected')<cr>
inorea <buffer> cl <esc>:call TestaTriggerSnippet('cl', 'SnippetPhpClass')<cr>

fun! SnippetPhpClass()
    execute "normal! aclass  {"
    execute "normal! hi\<C-R>=expand('%:r:t')\<CR>"
    normal! o}
    call feedkeys("O")
endfun

fun! SnippetPhpFunction()
    normal! afunction (<++>) {
    normal! 7hms
    normal! o<++>
    normal! o}
    normal! `s
    startinsert
endfun

fun! SnippetPhpPrivate()
    execute "normal! aprivate "
    startinsert!
endfun

fun! SnippetPhpPublic()
    execute "normal! apublic "
    startinsert!
endfun

fun! SnippetPhpProtected()
    execute "normal! aprotected "
    startinsert!
endfun

fun! SnippetPhpIf()
    normal! aif() {
    normal! 2hms
    normal! o<++>
    normal! o}
    normal! `s
    startinsert
endfun

fun! SnippetPhpDieDump()
    normal! ivar_dump();die;
    normal! ==5h
    startinsert
endfun
