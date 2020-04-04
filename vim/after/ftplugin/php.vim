" https://vim.fandom.com/wiki/Runtime_syntax_check_for_php
" Para usar o :make % e ver erro de syntax
compiler php
setl errorformat=%m\

nnoremap <buffer> <leader>r :terminal php %<CR>

" Map para executar comando de teste do composer
" echo "<?php system('composer test');" > neni-composer-test.php
nnoremap <buffer> <leader>ct :terminal php neni-composer-test.php<CR>
