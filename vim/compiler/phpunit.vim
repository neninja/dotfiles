" Vim compiler file
" Compiler:     PHP
" Maintainer:	Felipe Silva
" Last Change:	2020 Sep 30

if exists('current_compiler')
  finish
endif
let current_compiler = 'phpunit'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=composer\ test\ %

" THANKS: http://vimdoc.sourceforge.net/htmldoc/quickfix.html#errorformat-LaTeX
" THANKS: https://flukus.github.io/vim-errorformat-demystified.html
" THANKS: https://stackoVerflow.com/a/29102995/9881278
" THANKS: https://github.com/wincent/wincent/blob/b38dc93bb5/roles/dotfiles/files/.vim/after/compiler/README.md

" THANKS: https://stackoverflow.com/a/5296062/9881278
" THANKS: https://github.com/haginaga/vim-compiler-phpunit

CompilerSet errorformat=%E%n)\ %.%#:%o
CompilerSet errorformat+=%-G%.%#FAILURES!%.%#
CompilerSet errorformat+=%-G%.%#WARNINGS!%.%#
CompilerSet errorformat+=Fatal\ error:\ %m
CompilerSet errorformat+=%Z%f:%l
CompilerSet errorformat+=%W%f:%l:
CompilerSet errorformat+=%C%m
CompilerSet errorformat+=%C
CompilerSet errorformat+=%-G%.%#

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
