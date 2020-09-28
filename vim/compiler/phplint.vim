" Vim compiler file
" Compiler:	    PHP
" Maintainer:	Felipe Silva
" Last Change:	2020 Sep 17

if exists('current_compiler')
  finish
endif
let current_compiler = 'phplint'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=php\ -ln\ %

" THANKS: http://vimdoc.sourceforge.net/htmldoc/quickfix.html#errorformat-LaTeX
" THANKS: https://flukus.github.io/vim-errorformat-demystified.html
" THANKS: https://stackoverflow.com/a/29102995/9881278
" THANKS: https://github.com/wincent/wincent/blob/b38dc93bb5/roles/dotfiles/files/.vim/after/compiler/README.md

" THANKS: https://stackoverflow.com/a/7272248/9881278
" THANKS: https://stackoverflow.com/a/7193830/9881278
" THANKS: https://vim.fandom.com/wiki/Runtime_syntax_check_for_php

CompilerSet errorformat=Parse\ error:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G%.%#
" CompilerSet errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
" CompilerSet errorformat=PHP\ Parse\ error:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G%.%#

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
