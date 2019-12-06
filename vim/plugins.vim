" https://github.com/tpope/vim-git
" https://github.com/tpope/vim-vinegar
" https://github.com/xolox/vim-easytags
" https://github.com/xolox/vim-reload
" https://github.com/xolox/vim-publish
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

nnoremap <Tab> :CtrlPBuffer<CR>
nnoremap <c-t> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|dist\|vendor\|tags'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_show_hidden = 1

" Exibe mesmo os buffers abertos!
""let g:ctrlp_match_current_file = 1

let g:ctrlp_open_multiple_files = 'i'

let g:ctrlp_prompt_mappings = {
            \ 'CreateNewFile()':      ['<c-y>'],
            \ 'ToggleFocus()':        [''],
            \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
            \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
            \ 'PrtCurLeft()':         [''],
            \ 'AcceptSelection("h")': ['<c-h>', '<c-cr>', '<c-s>'],
            \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
            \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
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
let wiki_1.path = '~/vimwiki/' " wiki não versionada
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_2 = {}
let wiki_2.path = '~/dev/dotfiles/wiki/' " wiki versionada (pública)
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_3 = {}
let wiki_3.path = '~/aniversarios/' " wiki versionada (privada)
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'
let g:vimwiki_list = [wiki_2, wiki_1, wiki_3]
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
"
