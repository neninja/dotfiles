" Vim compiler file
" Compiler:	    Go
" Maintainer:	Felipe Silva
" Last Change:	2020 Sep 17

if exists('current_compiler')
  finish
endif
let current_compiler = 'gotest'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

if exists('g:nn_compiler_with_docker_compose')
    CompilerSet makeprg=docker-compose\ exec\ app\ go\ test\ $*
else
    CompilerSet makeprg=go\ test\ $*
endif

" THANKS: http://vimdoc.sourceforge.net/htmldoc/quickfix.html#errorformat-LaTeX
" THANKS: https://flukus.github.io/vim-errorformat-demystified.html
" THANKS: https://stackoverflow.com/a/29102995/9881278
" THANKS: https://github.com/wincent/wincent/blob/b38dc93bb5/roles/dotfiles/files/.vim/after/compiler/README.md

CompilerSet efm=%-G#%.%#,
      \%-GFAIL%.%#,
      \%-Gexit%.%#,
      \%-GPASS%.%#,
      \%-Gok%.%#,
      \can\'t\ load\ package:\ %m,
      \%f:%l:%c:\ %m,
      \%f:%l:\ %m,
      \%*\\s%f:%l\ %m,
      \%+A---\ FAIL:\ Example%.%#,
      \%C%m,

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
