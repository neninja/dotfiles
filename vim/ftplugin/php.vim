"## gf
" Facilita gf pois nomes de classes normalmente são os nomes dos arquivos"
setlocal suffixesadd=.php
setlocal path=**

"## maps

nnoremap <buffer> <leader><tab> :noa vim /\sfunction\s/g  % \| cw<CR>

"## AutoCmds
augroup phpau
    au! BufEnter *.blade.php execute "set ft=html"
    au! BufEnter *Test.php compiler phpunit
augroup END

"## Compiler
compiler phplint

nnoremap <buffer> <leader>r :silent make!\|cw<CR>

"## Snippets
" FIXME syntax do php buga com !cursor! como nome de função temporariamente
inorea <buffer><expr> fun TestaTriggerSnippet('fun',
            \ "function funcName(param)<cr>{<cr>/* código */<cr>}",
            \ ['funcName', 'param', '\/\* código \*\/'])
inorea <buffer><expr> dd TestaTriggerSnippet('dd',
            \ "var_dump('debug');die;",
            \ ["'debug'"])
inorea <buffer><expr> if TestaTriggerSnippet('if',
            \ "if(true){<cr>/* código */<cr>}",
            \ ['true', '\/\* código \*\/'])
inorea <buffer><expr> -p TestaTriggerSnippet('-p',
            \ "private $var;",
            \ ['$var;'])
inorea <buffer><expr> +p TestaTriggerSnippet('+p',
            \ "public $var;",
            \ ['$var;'])
inorea <buffer><expr> #p TestaTriggerSnippet('#p',
            \ "protected $var;",
            \ ['$var;'])

inorea <buffer><expr> cl TestaTriggerSnippet('cl',
            \ "<esc>:call SnippetPhpClassInterface('class')<cr>",
            \ ['#code'])

inorea <buffer><expr> i TestaTriggerSnippet('i',
            \ "<esc>:call SnippetPhpClassInterface('interface')<cr>",
            \ ['#code'])

fun! SnippetPhpClassInterface(kw)
    noa execute "normal! a".a:kw
    noa execute "normal! A \<C-R>=expand('%:t:r')\<CR>"
    noa normal! o{
    noa normal! o}
    noa normal! O #code
endfun

"## Funções
"### Getters e Setters
fun! NN_PHPCreateGettersSetters()
    let propName = <SID>GetProp()
    call <SID>CommandGetterSetter(propName, 'CreateGetter')
    call <SID>CommandGetterSetter(propName, 'CreateSetter')
endfun

fun! NN_PHPCreateSetter()
    let propName = <SID>GetProp()
    call <SID>CommandGetterSetter(propName, 'CreateSetter')
endfun

fun! NN_PHPCreateGetter()
    let propName = <SID>GetProp()
    call <SID>CommandGetterSetter(propName, 'CreateGetter')
endfun

fun! s:GetProp()
    let initialLine = line("v")
    let conteudo = getline('.')
    let propName = matchstr(conteudo, '\(private\|protected\)\s\$\w*')
    let propName = matchstr(propName, '\$\w*')
    let propName = matchstr(propName, '\w*', 1)

    if(propName == '')
        throw "Sem variável"
    endif

    return propName
endfun

fun! s:CommandGetterSetter(propName, createFunc)
    call search('^class ', 'bW')
    let initialLine = line('.')

    call search('{')

    normal! %

    let finalLine = line('.')
    if(finalLine <= initialLine)
        throw "Classe sem fechamento"
    endif

    let normalCommand = 'O'
    if (getline(line('.')-1) != '')
        let normalCommand = "O\<CR>"
    endif

    exe "call <SID>".a:createFunc."(a:propName, finalLine, normalCommand)"
endfun

fun! s:CreateGetter(propName, finalLine, commandInsert)
    let funcName = 'get'.toupper(a:propName[0]).a:propName[1:]
    if(search('\s*public function '.funcName.'('))
        return
    endif

    exe a:finalLine

    call <SID>insertGetter(a:propName, funcName, a:commandInsert)
endfun

fun! s:CreateSetter(propName, finalLine, commandInsert)
    let funcName = 'set'.toupper(a:propName[0]).a:propName[1:]
    if(search('\s*public function '.funcName.'('))
        return
    endif

    exe a:finalLine

    call <SID>insertSetter(a:propName, funcName, a:commandInsert)
endfun

fun! s:insertGetter(propName, funcName, normalCommand)
    exe "normal! ".a:normalCommand."public function ".a:funcName."() {\<CR>}"
    exe "normal! Oreturn $this->".a:propName.";"
endfun

fun! s:insertSetter(propName, funcName, normalCommand)
    exe "normal! ".a:normalCommand."public function ".a:funcName."($".a:propName.") {\<CR>}"
    exe "normal! O$this->".a:propName." = $".a:propName.";"
    exe "normal! oreturn $this;"
endfun
