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


" FIXME syntax do php buga com !cursor! como nome de função temporariamente
inorea <buffer><expr> fun TestaTriggerSnippet('fun',
            \ "function funcName(param){<cr>/* código */<cr>}",
            \ ['funcName', 'param', '\/\* código \*\/'])
inorea <buffer><expr> dd TestaTriggerSnippet('dd',
            \ "var_dump('debug')",
            \ ["'debug'"])
inorea <buffer><expr> if TestaTriggerSnippet('if',
            \ "if(true){<cr>/* código */<cr>}",
            \ ['true', '\/\* código \*\/'])
inorea <buffer><expr> - TestaTriggerSnippet('-',
            \ "private $var;",
            \ ['$var;'])

""inorea <buffer><expr> cl TestaTriggerSnippet('cl',
""            \ "<esc>:call SnippetPhpClass()<cr>")
""fun! SnippetPhpClass()
""    noa execute "normal! aclass  {"
""    noa execute "normal! hi\<C-R>=expand('%:r:t')\<CR>"
""    noa normal! o}
""    noa call feedkeys("O")
""endfun

""fun! s:insertCreateGetterSetter()
""    execute "normal! 0wwlve\"sy"
""    call PHPCreateGetter(<c-r><c-*>)
""    "vi{\<ESC>opublic function get"
""    normal! "spA(){
""    normal! o}
""    normal! Oreturn $
""    normal! "spA;
""endfun
""
""fun! PHPCreateGetter(varName)
""    if search()
""endfun
