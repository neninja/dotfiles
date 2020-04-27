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
            \ ['funcName', '\/\* código \*\/'])
inorea <buffer><expr> ed TestaTriggerSnippet('ed',
            \ "export default varFunc",
            \ ['default', 'varFunc'])
inorea <buffer><expr> im TestaTriggerSnippet('im',
            \ "import lib from 'module'",
            \ ['module', 'lib'])


inoremap <buffer> <c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit
inoremap <buffer> <c-d><c-s> <esc>bi<<esc>ea/><esc>
inoremap <buffer> <c-d><c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit<cr><esc>O
