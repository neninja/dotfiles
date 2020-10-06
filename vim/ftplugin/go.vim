"## Comandos
command! -nargs=1 GoDoc !go doc <args>
" interpreta package.Fun como um nome de arquivo
nnoremap K :GoDoc <c-r><c-f><cr>

" go get golang.org/x/tools/cmd/goimports
command! GoFmt silent !goimports -w %
" command! GoFmt !gofmt -w %

"## AutoCmds
augroup goau
    autocmd! BufWritePost *.go GoFmt
augroup END

"## Compiler
compiler gotest

nnoremap <buffer> <leader>r :call NN_GoTest()<CR>

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
    silent make! | cw

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
        
