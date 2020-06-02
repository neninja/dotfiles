" Scripts comuns a todos filetypes de javascript, como typescript e javascript
" react. Para ver se o arquivo está sendo carregado use :scriptnames

inorea <buffer><expr> log TestaTriggerSnippet('log',
            \ 'console.log("debug")',
            \ ['"debug"'])
inorea <buffer><expr> if TestaTriggerSnippet('if',
            \ "if(true){<cr>/* código */<cr>}",
            \ ['true', '\/\* código \*\/'])
inorea <buffer><expr> fun TestaTriggerSnippet('fun',
            \ "function funcName(params){<cr>/* código */<cr>}",
            \ ['funcName', 'params', '\/\* código \*\/'])
inorea <buffer><expr> ed TestaTriggerSnippet('ed',
            \ "export default varFunc",
            \ ['default', 'varFunc'])
inorea <buffer><expr> im TestaTriggerSnippet('im',
            \ "import lib from 'module'",
            \ ['module', 'lib'])

" react snippets
inorea <buffer><expr> constr TestaTriggerSnippet('constr',
            \ "import React from 'react'<CR><CR>const <C-R>=expand('%:p:h:t')<CR>: React.FC = () => {<CR>/* código */<CR>}<CR><CR>export default <C-R>=expand('%:p:h:t')<CR>",
            \ ['\/\* código \*\/'])

fun! NN_CriarSpecJS()
    let file = expand('%:r:t') . ".spec." . expand('%:e')
    " comando silenciado para esconder mensagem de erro da tentativa de
    " redefinir NN_CriarSpecJS durante a execução da mesma
    exec "silent! e " . file
endfun


inoremap <buffer> <c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit
inoremap <buffer> <c-d><c-s> <esc>bi<<esc>ea /><esc>hi
inoremap <buffer> <c-d><c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit<cr><esc>O
