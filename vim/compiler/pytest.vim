" Vim compiler file
" Compiler:	    Go
" Maintainer:	Felipe Silva
" Last Change:	2020 Sep 17

if exists('current_compiler')
  finish
endif
let current_compiler = 'pytest'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

if exists('g:nn_compiler_with_docker_compose')
    CompilerSet makeprg=docker-compose\ exec\ app\ pytest\ -q\ --tb=short\ --color=no\ $*
else
    CompilerSet makeprg=pytest\ -q\ --tb=short\ --color=no
endif

" THANKS: http://vimdoc.sourceforge.net/htmldoc/quickfix.html#errorformat-LaTeX
" THANKS: https://flukus.github.io/vim-errorformat-demystified.html
" THANKS: https://stackoverflow.com/a/29102995/9881278
" THANKS: https://github.com/wincent/wincent/blob/b38dc93bb5/roles/dotfiles/files/.vim/after/compiler/README.md

CompilerSet errorformat=%f:%l:\ %m

CompilerSet errorformat+=%-G=%.%#
CompilerSet errorformat+=%-G_%.%#
CompilerSet errorformat+=%-GFAILED%.%#
CompilerSet errorformat+=%-G%.%#failed\ in\ %.%#
CompilerSet errorformat+=%-G%.%#passed\ in\ %.%#
CompilerSet errorformat+=%-G%.%#failed,%.%#passed\ in\ %.%#
CompilerSet errorformat+=%-G%.%#passed,%.%#failed\ in\ %.%#
CompilerSet errorformat+=%-G%.%#[%.%#%%]%.%#

CompilerSet errorformat+=%-G\ %.%#

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
