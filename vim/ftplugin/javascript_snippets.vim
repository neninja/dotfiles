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
inorea <buffer><expr> er TestaTriggerSnippet('er',
            \ "export function <C-R>=expand('%:p:h:t')<CR>() {<CR>return (<CR>/* código */<CR>)<CR>}",
            \ ['\/\* código \*\/'])

" jest/cypress snippetsit test'
inorea <buffer><expr> it TestaTriggerSnippet('it',
            \ "it('testdesc', () => {<CR>/* código */<CR>})",
            \ ['it', 'testdesc', '\/\* código \*\/'])

inorea <buffer><expr> ito TestaTriggerSnippet('it',
            \ "it.only('testdesc', () => {<CR>/* código */<CR>})",
            \ ['it', 'testdesc', '\/\* código \*\/'])

" cy.get
inorea <buffer><expr> cg TestaTriggerSnippet('cg',
            \ "cy.get('[data-testid=datatestid]')",
            \ ['datatestid'])
inorea <buffer><expr> cs TestaTriggerSnippet('cs',
            \ "cy.get('[data-testid=datatestid]').should('expected.chained')",
            \ ['datatestid', 'expected\.chained'])
inorea <buffer><expr> cc TestaTriggerSnippet('cc',
            \ "cy.get('[data-testid=datatestid]').click()",
            \ ['datatestid'])
inorea <buffer><expr> ct TestaTriggerSnippet('ct',
            \ "cy.get('[data-testid=datatestid]').type('typed text')",
            \ ['datatestid', 'typed text'])

inorea <buffer><expr> cf TestaTriggerSnippet('cf',
            \ "cy.fixture('filenameFixture').as('aliasFilename').then(function(){<CR>/* código */<CR>})",
            \ ['filenameFixture', 'aliasFilename', '\/\* código \*\/'])

inorea <buffer><expr> cw TestaTriggerSnippet('cw', "cy.wrap(wrpObj)", ['wrpObj'])
inorea <buffer><expr> cws TestaTriggerSnippet('cws', "cy.wrap(wrpObj).should('expected.chained')", ['wrpObj', 'expected\.chained'])

" expect
inorea <buffer><expr> ee TestaTriggerSnippet('ee', "expect(someVar).eq(someValue)", ['someVar', 'someValue'])
inorea <buffer><expr> eel TestaTriggerSnippet('eel', "expect(someVar).eql(someValue)", ['someVar', 'someValue'])

" cypress template
inorea <buffer><expr> cytemplate TestaTriggerSnippet('ct',
            \ "describe('Test Desc', () => {<CR>before(() => {<CR>cy.visit('localhost:8888_site')<CR>})<CR><CR>beforeEach(() => {<CR>cy.reload()<CR>})<CR><CR>it('Deve ', () => {<CR>/* código */<CR>})<CR>})",
            \ ['Test Desc', 'localhost:8888_site', 'Deve ', '\/\* código \*\/'])

fun! NN_JS_CriaOuAcessaSpec()
    let file = expand('%:r:t') . ".spec." . expand('%:e')
    " comando silenciado para esconder mensagem de erro da tentativa de
    " redefinir NN_CriarSpecJS durante a execução da mesma
    exec "silent! e " . file
endfun


inoremap <buffer> <c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit
inoremap <buffer> <c-d><c-s> <esc>bi<<esc>ea /><esc>hi
inoremap <buffer> <c-d><c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit<cr><esc>O
