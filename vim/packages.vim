"https://vimhelp.org/repeat.txt.html#packages
"# Gerenciamento/inicialização
"TODO criar packager manager como vim-plug, para substituir script de clone
"   :helptags ALL
"   :helptags ~/vimfiles/pack/vendor/start/*/doc
"   vim -u NONE -c "helptags fugitive/doc" -c q
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
" PROS:
"   - Search de buffer advinhando conforme é digitado
"   - Search de file advinhando conforme é digitado
"   - Search de mru advinhando conforme é digitado
"   - Search de tag advinhando conforme é digitado
"   - se adequa ao repositorio git
"   - abre facilmente vertical e horizontal split
"   - criação de arquivos e folder rapidamente
" CONS:
"   - Não funciona as vezes TODO ver o motivo
"   - Pode ser meio lento
" TODO procurar solução própria do vim
" https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/dr2qo4k?utm_source=share&utm_medium=web2x
" https://www.vi-improved.org/recommendations/

" USOS:
"   Escolher arquivo <c-p> pesquisar/escolher arquivo <enter>
"   Criar arquivos e o path: <c-p> digitar arquivo ou /path/arquivo a ser criado <c-y><enter>
"   Escolher arquivo em split: <c-p> pesquisar/escolher arquivo <c-h>
"   Escolher arquivo em vsplit: <c-p> pesquisar/escolher arquivo <c-v>
"
" DICAS:
" É possível usar tab para completar nomes de pastas

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
" PROS:
"   - facilita com o f

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
" PROS:
"   - generate getter e setter (bugado)
" TODO substituir por implementação própria

" disable the default mapping
"let g:vim_php_refactoring_use_default_mapping = 0

"## Vim Startify
" https://github.com/mhinz/vim-startify
" PROS:
"   - Gerenciamento de sessões
"   - Comandos na tela inicial

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
            \ ['Sua única limitação é você mesmo', '- Rocketseat GoStack11'],
            \ ['Não espere para plantar, apenas', 'tenha paciência para colher', '- Rocketseat GoStack11'],
            \ ]
let g:startify_lists = [
            \ { 'type': 'sessions', 'header': ['sessões'] },
            \ ]
            "\ { 'type': 'commands', 'header': ['comandos'] },
            "\ { 'type': 'bookmarks', 'header': ['bookmarks'] },
            "\ { 'type': 'files',     'header': ['recentes'] },
let g:startify_files_number = 5
let g:startify_bookmarks = [
            \ {'d': '~/dev/dotfiles'},
            \ ]
"let g:startify_commands = [
"            \ ':help reference',
"            \ ['Vim Reference', 'h ref'],
"            \ {'h': 'h ref'},
"            \ {'m': ['My magical function', 'call Magic()']},
"            \ ]

":SLoad       load a session    |startify-:SLoad|
":SSave[!]    save a session    |startify-:SSave|
":SDelete[!]  delete a session  |startify-:SDelete|
":SClose      close a session   |startify-:SClose|

"## VimWiki
" https://github.com/vimwiki/vimwiki
" PROS:
"   - Syntax md
"   - Syntax de ```
"   - checkbox <-space>
"   - gf nos links diretamente


" <leader>ws
let wiki_1 = {
            \ 'path': '~/dev/dotfiles/wiki/',
            \ 'syntax': 'markdown',
            \ 'ext': '.md'
            \ }
let wiki_2 = {
            \ 'path': '~/aniversarios',
            \ 'syntax': 'markdown',
            \ 'ext': '.md'
            \ }
let g:vimwiki_list = [wiki_1, wiki_2]

let g:vimwiki_folding='custom'
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_global_ext = 0

"let g:vimwiki_listsyms = ' .oOX' " default
let g:vimwiki_listsyms = ' x' " compatibilidade github

" sobescreve tab do vimwiki :h *vimwiki-local-mappings
nmap <Leader>wn <Plug>VimwikiNextLink |" liberar tab
nmap <leader>w- <Plug>VimwikiRemoveHeaderLevel |" liberar - (vim-choosewin)

" ver: lvimgrep /\[ \]/ % | lw

"## Fugitive
" https://github.com/tpope/vim-fugitive
" PROS:
"   - add, commit e status rápido
"   - comparare stage rápido
"   - git blame

"http://vimcasts.org/blog/2011/05/the-fugitive-series/

" Maps de :Gstatus/:G/<f3> (:h fugitive-maps ou g?)
"   - Navegação:
"       - ]] [[ navega entre commits e arquivos
"       - )( <c-n> <c-p> navega entre commits, arquivos e hunks
"       - <cr> abre arquivo
"   - Stage:
"      - U unstage all
"      - X descarta alterações
"      - - toggle stage unstage arquivo ou hunk
"   - Diff:
"       - = toggle diff inline
"       - dv vertical diff split
"           - usar :diffget (stage) :diffput (unstage) na index (fugitive)
"           - salvar e sair com ZZ
"   - Commits:
"       - cc abre janeja de mensagem de commit
"       - ca add staged ao ultimo commit e abre janela mensagem de commit
"       - ce add staged ao ultimo commit sem editá-lo
"       - cvc commita com detalhes diffs que não vão (ver commit -v)
"       OBS: fechar commit com ZZ ao invez de :wq
"   - Stash:

"TODO melhorar stage de hunks
"   - - já usado para trocar de tela
"   - -  é mt longe de v, j e k, os responsaveis por marcar o hunk

"### Statusline
set statusline=                 " reseta statusline
set statusline+=%{FugitiveStatusline()}                 " reseta statusline
set statusline+=\%=				" espaço
set statusline+=\ %f\ %r\%m\    " nome abreviado, readonly e modificado
set statusline+=\%=				" espaço
set statusline+=\ %p%%\ %l:\%c  " rownumber, total e percentual
set statusline+=\ %y            " filetype

"## Vim GitGutter
" https://github.com/airblade/vim-gitgutter
" PROS:
"   - Marcação de + ~ _
" CONS:
"   - Perf
"   - Dispara sozinho com :lvim
" TODO substituir plugin

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

"## Goyo
" https://github.com/junegunn/goyo.vim

"## Vim JSX Pretty
" https://github.com/MaxMEllon/vim-jsx-pretty
" PROS:
"   - Syntax jsx
"   - indentação jsx

"## ALE
" https://github.com/dense-analysis/ale
" PROS:
"   - Auto format com eslint E prettier
"   - mensagem de erro e aviso
"   - marcação do texto e código do erro
" TODO remover plugin
"https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29

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
"## Colorscheme
" https://github.com/joshdick/onedark.vim
" PROS:
"   - Cores agradáveis e com um constraste bom
"   - Suporte a muitas linguagens
" CONS:
"   - Não possui light theme

" colorscheme afterglow " outro tema muito bom
" https://github.com/danilo-augusto/vim-afterglow

"THANKS: https://github.com/joshdick/onedark.vim/issues/110#issuecomment-345599864
packadd! onedark.vim

colorscheme onedark

"## EditorConfig Vim
" https://github.com/editorconfig/editorconfig-vim
" PROS:
"   - Integração com editorconfig
"
" Exemplo de .editorconfig:
"
" root = true
" 
" [*]
" indent_style = space
" indent_size = 2
" charset = utf-8
" trim_trailing_whitespace = true
" insert_final_newline = true
"
"
" OBS: insert_final_newline funciona porém não aparece no vim!
" THANKS: https://github.com/editorconfig/editorconfig/wiki/Newline-at-End-of-File-Support#vim

"## Vim Multple Cursors
" https://github.com/terryma/vim-multiple-cursors
" PROS:
"   - Edição de tags
" TODO ver utilidade real do plugin

"## GV
" https://github.com/junegunn/gv.vim
" TODO ver utilidade real do plugin

"## Vim Rest Console
" https://github.com/diepm/vim-rest-console
" TODO ver utilidade real do plugin

" Instruções:
"   - ]] [[ navega entre blocos de requisição
"   - usar <c-j> no bloco da requisição

" quando não indicado nas opções de curl "-i" para informar o tipo de retorno,
" por padrão é json (afinal usarei como rest client somente)
let g:vrc_response_default_content_type = 'application/json'

" troca <c-j> pois uso com split
let g:vrc_trigger = '<C-x>'
