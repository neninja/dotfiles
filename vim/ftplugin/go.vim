command! -nargs=1 GoDoc !go doc <args>
" interpreta package.Fun como um nome de arquivo
nnoremap K :GoDoc <c-r><c-f><cr>

" go get golang.org/x/tools/cmd/goimports
command! GoFmt silent !goimports -w %
" command! GoFmt !gofmt -w %

augroup goau
    autocmd! BufWritePost *.go GoFmt
augroup END

"## Compiler
" let current_compiler = 'gotest'
compiler gotest
"
" :make|cw
" THANKS: https://vi.stackexchange.com/a/4808/28875
"
" set errorformat=%-G#%.%#
" set errorformat+=%-G%.%#panic:\ %m
" set errorformat+=%-GFAIL%.%#
" set errorformat+=%-Gexit%.%#
" set errorformat+=%-GPASS%.%#
" set errorformat+=%-Gok%.%#
" set errorformat+=%Acan\'t\ load\ package:\ %m
" set errorformat+=%+A---\ FAIL:\ Example%.%#
" set errorformat+=%A%.%#---\ FAIL:%.%#
" set errorformat+=%Z%f:%l:%c:\ %m
" set errorformat+=%Z%f:%l:\ %m
" set errorformat+=%*\\s%f:%l\ %m
" set errorformat+=%C%m

" melhor
" set errorformat=%-G#%.%#
" set errorformat+=%-G%.%#panic:\ %m
" set errorformat+=%-GFAIL%.%#
" set errorformat+=%-Gexit%.%#
" set errorformat+=%-GPASS%.%#
" set errorformat+=%-Gok%.%#
" set errorformat+=can\'t\ load\ package:\ %m
" set errorformat+=%f:%l:%c:\ %m
" set errorformat+=%f:%l:\ %m
" set errorformat+=%*\\s%f:%l\ %m
" set errorformat+=%+A---\ FAIL:\ Example%.%#
" set errorformat+=%C%m



" set errorformat+=%.%#---\ FAIL:\ %s\ (%.%#)
" set errorformat+=%+G---\ FAIL:%.%#
" set errorformat+=%E%+G---\ FAIL:%.%#
" set errorformat+=%P\\s%#%f:%.%#%r
" set errorformat+=\\s%#%f.go%.%#
" set errorformat+=%+O%\\s%#%f%r
" set errorformat+=%A%f:%l:\ %m
" set errorformat+=%+G---\ FAIL:\ Example%.%#
" set errorformat+=%+G%.%#---\ FAIL:%s
" set errorformat+=%.%#---\ FAIL:\ %s\ (%.%#)
" set errorformat+=%-G---%.%#
" set errorformat+=%-GFAIL%.%#
" set errorformat+=%-Gexit%.%#
" set errorformat+=%-Q%.%#---\ FAIL:%s

" set errorformat+=%E%.%#---\ FAIL:%s
" set errorformat+=%-P%f

" set errorformat+=%A%f:%l:\ %m
""setl errorformat=%-G#\ %.%#                    " Ignore lines beginning with "#" ("# command-line-arguments" line sometimes appears?)
""setl errorformat+=%-G%.%#panic:\ %m            " Ignore lines containing "panic: message"
""setl errorformat+=%Ecan\'t\ load\ package:\ %m " Start of multiline error string is "can't load package: message"
""setl errorformat+=%A%f:%l:%c:\ %m              " Start of multiline unspecified string is "filename:linenumber:columnnumber: message"
""setl errorformat+=%A%f:%l:\ %m                 " Start of multiline unspecified string is "filename:linenumber: message"
""setl errorformat+=%C%*\\s%m                    " Continuation of multiline error message is indented
""" setl errorformat+=%*\\s%f:%l\ %m               " Runtimeerror "filename:linenumber: message"
""setl errorformat+=%E---\ FAIL:,%C*\\s%f:%l\ %m               " Runtimeerror "filename:linenumber: message"
""
""setl errorformat+=%C%*\\s%m                    " Continuation of multiline error message is indented
""setl errorformat+=%E---\ FAIL:\ %m
""" setl errorformat+=%E---\ FAIL:\ Example%m,%C%m,%ZFAIL\ %m
""" setl errorformat+=%-G%.%#                      " All lines not matching any of the above patterns are ignored

" set errorformat=
" setl errorformat=%-G#\ %.%#
" setl errorformat+=%-G%.%#panic:\ %m
" setl errorformat+=%E%f:%l:%c:\ %m
" setl errorformat+=%E%f:%l:\ %m
" setl errorformat+=%*\\s%f:%l\ %m
" setl errorformat+=%E---\ FAIL:,%C*\\s%f:%l\ %m

" setl errorformat+=%C%*\\s%m
" setl errorformat+=%E---\ FAIL:\ %m
" setl errorformat+=%E---\ FAIL:\ %m,%C%f%lFAIL\ %m
" setl errorformat+=%E---\ FAIL:\ %m,%C%m,%ZFAIL\ %m

" set errorformat+=%E---\ FAIL:\ %m,%E%f%l\ %m
" set errorformat+=%E%.%#---\ FAIL:%.%#
" set errorformat+=%E%f:%l:\ %m
" set errorformat+=%C%m
" set errorformat+=%Z%.%#FAIL
" set errorformat+=%E%.%#---\ FAIL:\ %m:%.%#
" set errorformat+=%-G%.%#

" https://github.com/wincent/wincent/blob/b38dc93bb5/roles/dotfiles/files/.vim/after/compiler/README.md

" :make ./... testa recursivamente todo o projeto
" porém o quickfix não vai redirecionar para nenhum arquivo
" setl makeprg=go\ test
" setl makeprg=go\ run\ %

nnoremap <leader>r :call NN_GoTest()<CR>

function! NN_GoTest()
    " Exemplo de falha em go:
    "--- FAIL: TestOla (0.00s)
    "   ola_test.go:10: resultado 'Olá, mundo', esperado 'Olá, undo'
    "FAIL
    "FAIL    github.com/nenitf/projeto/ola      0.140s
    "FAIL                                                                              
    "
    " O path relativo é apontado diferente do arquivo com erro, portanto é
    " necessário trocar o pwd para o quickfix poder redirecionar para o arquivo
    " correto.
    " Caso o pwd permanesça em projeto/ o quickfix criará o arquivo
    " projeto/ola_test.go ao invés de usar o projeto/ola/ola_test.go
    execute "cd ".expand('%:h')

    " usar setl makeprg=go\ test
    silent make | cw

    " THANKS: https://stackoverflow.com/a/1553008/9881278
    if(!len(getqflist()))
        call NN_SetGitDir()
    endif
endfunction

"## Snippets
inorea <buffer><expr> f TestaTriggerSnippet('f',
            \ "func funcName(param) returntype {<cr>/* código */<cr>}",
            \ ['funcName', 'param', 'returntype', '\/\* código \*\/'])

inorea <buffer><expr> ft TestaTriggerSnippet('ft',
            \ "func TestFuncName(t *testing.T) {<cr>/* código */<cr>}",
            \ ['FuncName', '\/\* código \*\/'])

inorea <buffer><expr> fh TestaTriggerSnippet('fh',
            \ "func handleFuncName(res http.ResponseWriter, req *http.Request) {<cr>/* código */<cr>}",
            \ ['FuncName', '\/\* código \*\/'])

inorea <buffer><expr> hf TestaTriggerSnippet('hf',
            \ "http.HandleFunc(\"/routeHandle\", funcName)",
            \ ['routeHandle', 'funcName'])

inorea <buffer><expr> hls TestaTriggerSnippet('hls',
            \ "http.ListenAndServe(\":9000\", nil)",
            \ [':9000'])

inorea <buffer><expr> pl TestaTriggerSnippet('pl',
            \ "fmt.Println(\"debug\")",
            \ ['"debug"'])

inorea <buffer><expr> : TestaTriggerSnippet(':',
            \ "varname := varvalue",
            \ ['varname', 'varvalue'])

inorea <buffer><expr> ife TestaTriggerSnippet('ife',
            \ "if err != nil {<cr>/* código */<cr>}",
            \ ['\/\* código \*\/'])

inorea <buffer><expr> ift TestaTriggerSnippet('ift',
            \ "if got != want {<cr>t.Error(\"Got\", got, \"want\", want)<cr>}",
            \ ['!='])

inorea <buffer><expr> forr TestaTriggerSnippet('forr',
            \ "for varnames := range rangearray {<cr>/* código */<cr>}",
            \ ['varnames', 'rangearray', '\/\* código \*\/'])

inorea <buffer><expr> fori TestaTriggerSnippet('fori',
            \ "for i := 0; i <= maxCondition; i++ {<cr>/* código */<cr>}",
            \ ['maxCondition', '\/\* código \*\/'])

inorea <buffer><expr> fort TestaTriggerSnippet('fort',
            \ "var tests = []struct {<cr>in  []typeIn<cr>out typeOut<cr>}{}<cr>".
            \ "for _, test := range tests {<cr>got := testedFuncName(test.in...)<cr>".
            \ "if got != want {<cr>t.Error(\"For\", test.in, \"want\", test.out, \"got\", got)<cr>}<cr>}",
            \ ['typeIn', 'typeOut', 'testedFuncName', '\.\.\.'])

inorea <buffer><expr> ts TestaTriggerSnippet('ts',
            \ "time.Sleep(time.Millisecond * milliseconds)",
            \ ['milliseconds'])

inorea <buffer><expr> ri TestaTriggerSnippet('ri',
            \ "rand.Intn(maxRandInt)",
            \ ['maxRandInt'])
        
