"# Gerenciamento/inicialização
":helptags ALL
":helptags ~/vimfiles/pack/vendor/start/*/doc
" Configurações de plugins do vim
" Todos de terceiros estão clonados em start ou opt pelo path:
"   (windows) ~/vimfiles/pack/vendor/
"   (linux) ~/.vim/pack/vendor/
" Plugins próprios em:
"   (windows) ~/vimfiles/pack/nenitf/
"   (linux) ~/.vim/pack/nenitf/
"# Configurações
"## CtrlP
" USOS:
"   Escolher arquivo <c-p> pesquisar/escolher arquivo <enter>
"   Criar arquivos e o path: <c-p> digitar arquivo ou /path/arquivo a ser criado <c-y><enter>
"   Escolher arquivo em split: <c-p> pesquisar/escolher arquivo <c-h>
"   Escolher arquivo em vsplit: <c-p> pesquisar/escolher arquivo <c-v>
"
" DICAS:
" É possível usar tab para completar nomes de pastas
"
" PROS:
"   Escrito em vimscript
"   É possível criar arquivos diretamente

nnoremap <c-p> :CtrlP<CR>
nnoremap <c-m> :CtrlPMRUFiles<CR>
nnoremap <c-t> :CtrlPTag<CR>

let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules\|DS_Store\|\.git\|dist\|vendor\|_site\|.jekyll-cache',
            \ 'file': 'tags',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_show_hidden = 1

let g:ctrlp_open_multiple_files = 'i'

let g:ctrlp_types = ['fil', 'buf', 'mru']

let g:ctrlp_prompt_mappings = {
            \ 'CreateNewFile()':      ['<c-y>'],
            \ 'ToggleFocus()':        [''],
            \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
            \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
            \ 'PrtCurLeft()':         [''],
            \ 'AcceptSelection("h")': ['<c-h>', '<c-cr>', '<c-s>'],
            \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
            \ 'PrtHistory(1)':        ['<c-up>'],
            \ 'ToggleType(1)':        ['<c-p>'],
            \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
            \ 'MarkToOpen()':         ['<c-z>'],
            \ 'OpenMulti()':          ['<c-o>'],
            \ }

"## PHPToolBox
" disable the default mapping
"let g:vim_php_refactoring_use_default_mapping = 0
"## Startify
let g:startify_custom_header_quotes = [
            \ ['O apressado come cru'],
            \ ['Se deu hein'],
            \ ['Quem não tem cabeça, tem perna'],
            \ ['Para quem só sabe usar martelo,', 'todo problema é um prego.', '- Abraham Maslow'],
            \ ]
let g:startify_lists = [
            \ { 'type': 'sessions', 'header': ['sessões'] },
            \ ]
            "\ { 'type': 'bookmarks', 'header': ['bookmarks'] },
            "\ { 'type': 'files',     'header': ['recentes'] },
let g:startify_files_number = 5
let g:startify_bookmarks = [
            \ {'d': '~/dev/dotfiles'},
            \ ]
":SLoad       load a session    |startify-:SLoad|
":SSave[!]    save a session    |startify-:SSave|
":SDelete[!]  delete a session  |startify-:SDelete|
":SClose      close a session   |startify-:SClose|
"## VimWiki
" <leader>ws
let wiki_1 = {}
let wiki_1.path = '~/dev/dotfiles/wiki/' " wiki versionada (pública)
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_2 = {}
let wiki_2.path = '~/aniversarios/' " wiki versionada (privada)
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_folding='custom'
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_global_ext = 0

" sobescreve tab do vimwiki
nmap <Leader>wn <Plug>VimwikiNextLink

"<c-space> toggle X
"## Themes
" Ver highlight-groups
"so $VIMRUNTIME/syntax/hitest.vim
""let g:onedark_terminal_italics = 1
" onedark adaptado
" Ver highlight group da palavra sob o cursor
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" :highlight mostra as cores do grupo
command Syntax echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
so ~/dev/dotfiles/vim/thenfeite.vim
highlight CursorColumn guibg=#0a0c0f
highlight CursorLine guibg=#0a0c0f gui=underline cterm=underline
hi! Folded guibg=purple
"### Dev and Apresentation mode
"fun DevRead()
"    Goyo!
"    set background=dark
"endfun
"command Dev call DevRead()
"
"fun AprRead()
"    Goyo
"    set background=light
"endfun
"command Apr call AprRead()
"## ALE
"nmap <silent> ! <Plug>(ale_next_wrap)
"
"function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? 'OK' : printf(
"                \   '%dW %dE',
"                \   all_non_errors,
"                \   all_errors
"                \)
"endfunction
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"
"## auto-pairs.vim
"" para habilitar <c-h>
let g:AutoPairsMapCh = 0
let g:AutoPairsMoveCharacter=""

"## vim-auto-popmenu

" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'*':1}

"## vim-dict
" não selecionar o primeiro item automaticamente
set completeopt+=noselect

" desabilita tab/shift-tab pois utilizo como trigger de snippet"
let g:apc_enable_tab=0

" filetype: dicionarios
let g:vim_dict_config = {
            \ 'html':'html,javascript,css',
            \ 'markdown':'text',
            \ 'javascript':'javascript',
            \ 'php':'php,phpunit'
            \ }

" dicionarios pessoais
let g:vim_dict_dict = [
    \ '~/dev/dotfiles/vim/dicionarios'
    \ ]

"## Gitgutter
" <leader>hp -> mostra valor anterior do hunk
" <leader>hs -> stage["git add line"] modificação, removendo chunk
" <leader>hu -> desfaz modificação não staged no chunk
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

" atualização mais rápida
set updatetime=100

":GitGutterEnable
let g:gitgutter_enabled=0
cnoreabbrev ggt call Gitguttettog()

fun Gitguttettog()
    GitGutterToggle
    echo "Use [h ]h e <leader>hp <leader>hs <leader>hu"
endfun

"## Fugitive
" Para tirar arquivos de staged basta aperter :G
"   na janela de status apertar - no arquivo para add ou remover

" :ga git add %
cnoreabbrev gw Gw
" :gb ver linha a linha os commits
cnoreabbrev gb Gblame
" :gc git commit
cnoreabbrev gc Gcommit
" :gd mostra diferenças
cnoreabbrev gd Gdiff
" :gs mostra status de staged ou não
cnoreabbrev gs Gstatus
" :gvs abre em vertical split o mesmo arquivo staged ou comitado
cnoreabbrev gvs Gvsplit
" :gvd abre em vertical split o mesmo arquivo com as diferença de quando esteve staged ou comitado
cnoreabbrev gvd Gvdiff

"### Statusline
set statusline=                 " reseta statusline
set statusline+=%{FugitiveStatusline()}                 " reseta statusline
set statusline+=\%=				" espaço
set statusline+=\ %r\%m\%f\     " nome readonly, modificado e nome abreviado
set statusline+=\%=				" espaço
set statusline+=\ %p%%\ %l:\%c  " rownumber, total e percentual
