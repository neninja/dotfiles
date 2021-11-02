" Vim compiler file
" Compiler:	    Go
" Maintainer:	Felipe Silva
" Last Change:	2021 Nov 2

if exists('current_compiler')
  finish
endif
let current_compiler = 'goimports'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

" go get golang.org/x/tools/cmd/goimports
CompilerSet makeprg=goimports\ -w\ %
" CompilerSet makeprg=gofmt\ -w\ %

CompilerSet errorformat+=%f:%l:%c:\ %m
CompilerSet errorformat+=%f:%l:\ %m

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
