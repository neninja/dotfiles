"https://vimhelp.org/repeat.txt.html#packages
"# Gerenciamento/inicialização
"TODO: criar packager manager como vim-plug, para substituir script de clone
"   :helptags ALL
"   :helptags ~/vimfiles/pack/vendor/start/*/doc
"    Configurações de plugins do vim
"    Todos de terceiros estão clonados em start ou opt pelo path:
"      (windows) ~/vimfiles/pack/vendor/
"      (linux) ~/.vim/pack/vendor/
"    Plugins próprios em:
"      (windows) ~/vimfiles/pack/nenitf/
"      (linux) ~/.vim/pack/nenitf/

"# Configurações e instruções
"## CtrlP
" https://github.com/ctrlpvim/ctrlp.vim

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

nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>t :CtrlPTag<CR>

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

"## Quick Scope
" https://github.com/unblevable/quick-scope

" :QuickScopeToggle

" Deve vir antes da definição final do colorscheme
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" let g:qs_lazy_highlight = 1
"## Vim PHP Refactoring Toolbox
" https://github.com/adoy/vim-php-refactoring-toolbox

" disable the default mapping
"let g:vim_php_refactoring_use_default_mapping = 0

"## Vim Startify
" https://github.com/mhinz/vim-startify

let g:startify_custom_header_quotes = [
            \ ['wtf neni?', '- Rei ????'],
            \ ['Bom trabalho meu amorzinho, te amo mto', '- Luizi 2020'],
            \ ['O apressado come cru', '- Mãe 2020'],
            \ ['Se deu hein', '- Pai 2019'],
            \ ['Quem não tem cabeça, tem perna', '- Mãe 2020'],
            \ ['Quem come quieto come sempre', '- Luizi 2019'],
            \ ['Vish kk 🍑', '- LubaTV'],
            \ ['Oooh! I burned my moooovie! 🔥', '- Miena 2020'],
            \ ['Se um passarinho sujar você,', 'não reclame. Agradeça que as', 'vacas não voam', '- Miena 2020'],
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
" https://github.com/vimwiki/vimwiki

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

" sobescreve tab do vimwiki :h *vimwiki-local-mappings
nmap <Leader>wn <Plug>VimwikiNextLink |" liberar tab
nmap <leader>w- <Plug>VimwikiRemoveHeaderLevel |" liberar - (vim-choosewin)

" ver: lvimgrep /\[ \]/ % | lw

"## Fugitive
" https://github.com/tpope/vim-fugitive

" Para tirar arquivos de staged basta aperter :G
"   na janela de status apertar - no arquivo para add ou remover


"### Statusline
set statusline=                 " reseta statusline
set statusline+=%{FugitiveStatusline()}                 " reseta statusline
set statusline+=\%=				" espaço
set statusline+=\ %r\%m\%f\     " nome readonly, modificado e nome abreviado
set statusline+=\%=				" espaço
set statusline+=\ %p%%\ %l:\%c  " rownumber, total e percentual
set statusline+=\ %y            " filetype

"## Vim GitGutter
" https://github.com/airblade/vim-gitgutter

" <leader>hp -> mostra valor anterior do hunk
" <leader>hs -> stage["git add line"] modificação, removendo chunk
" <leader>hu -> desfaz modificação não staged no chunk
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

" atualização mais rápida
set updatetime=100

":GitGutterEnable
let g:gitgutter_enabled=0

fun! NN_Gitguttettog()
    GitGutterToggle
    echo "Use [h ]h e <leader>hp <leader>hs <leader>hu"
endfun

"## ALE
" https://github.com/dense-analysis/ale

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
"## Vim Auto Popmenu
" https://github.com/skywind3000/vim-auto-popmenu

" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'*':1}

"## Vim Dict
" https://github.com/skywind3000/vim-dict

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

"## Vim ChooseWin
" https://github.com/t9md/vim-choosewin

nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

"## Colorscheme
" https://github.com/joshdick/onedark.vim

" colorscheme afterglow " outro tema muito bom
" https://github.com/danilo-augusto/vim-afterglow

"THANKS: https://github.com/joshdick/onedark.vim/issues/110#issuecomment-345599864
packadd! onedark.vim

colorscheme onedark

"## EditorConfig Vim
" https://github.com/editorconfig/editorconfig-vim

"## Vim Multple Cursors
" https://github.com/terryma/vim-multiple-cursors

"## GV
" https://github.com/junegunn/gv.vim

"## Vim Rest Console
" https://github.com/diepm/vim-rest-console
