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
"## ctrlpvim/ctrlp.vim
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
            \ 'dir':  'node_modules\|DS_Store\|\.git\|dist\|vendor\|_site\|.jekyll-cache\|ios\|android\|.venv\|build',
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

"## junegunn/fzf.vim
"Usar GFiles (com gitignore) ou Files
"https://rietta.com/blog/hide-gitignored-files-fzf-vim/
" nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
"nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"

" fecha split ao cancelar pesquisa
" https://github.com/junegunn/fzf.vim/issues/544#issuecomment-457456166
"tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"## unblevable/quick-scope
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

"## mhinz/vim-startify
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
            \ ['Sua única limitação é você mesmo', '- Rocketseat 🚀 GoStack11'],
            \ ['Faça seu melhor, mas sempre com', 'prazo de entrega', '- Rocketseat 🚀 GoStack11'],
            \ ['Não espere para plantar, apenas', 'tenha paciência para colher', '- Rocketseat 🚀 GoStack11'],
            \ ['Sucesso não é o resultado de um ', 'jogo, mas o destino de uma jornada', '- Rocketseat 🚀 GoStack11'],
            \ ['Para quem fica melhor a cada dia,', 'ficar pronto é utopia', '- Rocketseat 🚀 GoStack11'],
            \ ['Só deseje as coisas as quais você', 'está disposto a lutar', 'ficar pronto é utopia', '- Rocketseat 🚀 GoStack11'],
            \ ['Não espere resultados brilhantes', 'se suas metas não forem claras', '- Rocketseat 🚀 GoStack11'],
            \ ['Não existe linha de chegada,', 'a vitória está em se manter correndo', '- Rocketseat 🚀 GoStack11'],
            \ ['Mude você e todo o resto mudará naturalmente', '- Rocketseat 🚀 GoStack11'],
            \ ['O tempo que leva para realizar seus sonhos', 'vai passar de qualquer forma', '- Rocketseat 🚀 GoStack11'],
            \ ['Nada no mundo supera a persistência', '- Rocketseat 🚀 GoStack11'],
            \ ]
let g:startify_lists = [
            \ { 'type': 'sessions', 'header': ['sessões'] },
            \ { 'type': 'commands', 'header': ['comandos'] },
            \ ]
            "\ { 'type': 'bookmarks', 'header': ['bookmarks'] },
            "\ { 'type': 'files',     'header': ['recentes'] },
let g:startify_files_number = 5
"let g:startify_bookmarks = [
"            \ {'d': '~/dev/dotfiles'},
"            \ ]
let g:startify_commands = [
            \ {'d': ['dotfiles', ':call GoToDotfiles()']},
            \ {'t': 'TodoList'},
            \ ]
"            \ ':help reference',
"            \ ['Vim Reference', 'h ref'],
"            \ {'h': 'h ref'},
"            \ {'m': ['My magical function', 'call Magic()']},
"            \ ]

":SLoad       load a session    |startify-:SLoad|
":SSave[!]    save a session    |startify-:SSave|
":SDelete[!]  delete a session  |startify-:SDelete|
":SClose      close a session   |startify-:SClose|

function! GoToDotfiles()
    exec "cd ".g:dotfiles_dir
    e vim/vimrc
endfun

"## vimwiki/vimwiki
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

" desativa syntax do vimwiki como global
" ela tem algumas coisas que distoam do markdown puro, como ** *** ``
let g:vimwiki_global_ext = 0

"let g:vimwiki_listsyms = ' .oOX' " default
let g:vimwiki_listsyms = ' x' " compatibilidade github

" sobescreve tab do vimwiki :h *vimwiki-local-mappings
nmap <Leader>wn <Plug>VimwikiNextLink |" liberar tab
nmap <leader>w- <Plug>VimwikiRemoveHeaderLevel |" liberar - (vim-choosewin)

" ver: lvimgrep /\[ \]/ % | lw

"## plasticboy/vim-markdown
" PROS:
"   - Conceal de * ** *** ` `` ```ft
"   - Tem a navegação com :Toc

" desabilita folds (fica estranho com jekyll)
let g:vim_markdown_folding_disabled = 1

" desabilita maps
let g:vim_markdown_no_default_key_mappings = 1

" cabeçalho do documento, usado no jekyll
let g:vim_markdown_frontmatter = 1

let g:vim_markdown_new_list_item_indent = 0

"## tpope/vim-fugitive
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

command! GC :Gw | Gcommit

"### Statusline
set statusline=                 " reseta statusline
set statusline+=%{FugitiveStatusline()}                 " reseta statusline
set statusline+=\%=				" espaço
set statusline+=\ %f\ %r\%m\    " nome abreviado, readonly e modificado
set statusline+=\%=				" espaço
set statusline+=\ %p%%\ %l:\%c  " rownumber, total e percentual
set statusline+=\ %y            " filetype
set statusline+=\ {%n}          " buffer, ideal para conflitos do git com :diffget e :diffput

"## airblade/vim-gitgutter
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

" desabilita maps do gitgutter
let g:gitgutter_map_keys = 0

"## junegunn/goyo.vim
" PROS:
"   - Leitura mais confortável da wiki
"
" THANKS: https://gist.github.com/davidmh/f4337f9ea9eca6789b3f8222b8333a35
" Presentation mode
function! s:enter_presentation()
    setl nospell
    setl scrolloff=0
    normal ggzjzO
    " nnoremap <buffer> <right> :call search("^##", 'W')<CR>zMzvzt
    nnoremap <silent><buffer> <right> :call search("^## ", 'W')<CR>zMzOzt
    " nnoremap <buffer> <left> :call search("^##", 'bW')<CR>zMzvzt
    nnoremap <silent><buffer> <left> :call search("^## ", 'bW')<CR>zMzOzt
endfunction

function! s:exit_presentation()
    set scrolloff=3
    nunmap <buffer> <left>
    nunmap <buffer> <right>
endfunction

autocmd! User GoyoEnter nested call <SID>enter_presentation()
autocmd! User GoyoLeave nested call <SID>exit_presentation()
"
"## pangloss/vim-javascript
" PROS:
"   - Syntax js

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "←"
let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "→"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

"## Quramy/tsuquyomi
" PROS:
"   - Rápido
"   - Vimscript (out of box)
"   - Quickfix dos erros e autocomplete do omnifunc

packadd! tsuquyomi
let g:tsuquyomi_disable_default_mappings = 1

"## MaxMEllon/vim-jsx-pretty
" PROS:
"   - Syntax jsx
"   - indentação jsx

"## dense-analysis/ale
" PROS:
"   - Auto format com eslint E prettier
"   - mensagem de erro e aviso
"   - marcação do texto e código do erro
" TODO remover plugin
"https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29

" Set de lintes
let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint'],
            \ 'javascriptreact': ['prettier', 'eslint'],
            \ 'typescript': ['prettier', 'eslint'],
            \ 'typescriptreact': ['prettier', 'eslint']
            \ }

" Força correção de acordo com o lint ao salvar o arquivo
let g:ale_fix_on_save = 1
" :ALEFix caso não formate por algum motivo
" E se não der usar cli:
"   :!prettier --write %
"   :!yarn eslint --fix %

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
"## colorschemes

"### joshdick/onedark.vim
" PROS:
"   - Cores agradáveis
"   - Baixo contraste (melhor para leitura)
"   - Suporte a todas linguagens que utilizo
"   - Tema popular (constantes atualizações)
" CONS:
"   - Não possui light theme
"   - Possivelmente a quantidade de cores afeta perf

" colorscheme afterglow " outro tema muito bom
" https://github.com/danilo-augusto/vim-afterglow

"THANKS: https://github.com/joshdick/onedark.vim/issues/110#issuecomment-345599864
" packadd! onedark.vim
" colorscheme onedark

"### andreasvc/vim-256noir
" PROS:
"   - Cores agradáveis
"   - Não distrai com multiplas cores em tela
" CONS:
"   - Não possui light theme
"   - Cores de diff de adição ou remoção não são intuitivas
"   - Tema não popular, atualização baixa

" colorscheme 256_noir

"### ewilazarus/preto
" PROS:
"   - Cores agradáveis
"   - Não distrai com multiplas cores em tela
" CONS:
"   - Contraste alto
"   - Conceal estranho
"   - Não possui light theme
"   - Cursor preto se perde no editor
"   - Tema não popular, atualização baixa

"### pgdouyon/vim-yin-yang
" PROS:
"   - Cores agradáveis e com um constraste bom
"   - Baixo contraste (melhor para leitura)
"   - Não distrai com multiplas cores em tela
" CONS:
"   - Tema não popular, atualização baixa
"   - SpellBad com contraste estranho
"   - Search com contraste estranho
"   - MatchParen com contraste estranho
"   - LineNr com background desnecessário

colo yin

fun! FixColorschemeYin()
  highlight LineNr guibg=#1c1c1c ctermbg=234
  highlight Search guibg=#eeeeee guifg=#080808 ctermbg=255 ctermfg=232 term=none
  highlight MatchParen guibg=blue guifg=white
endfun

augroup override_highlights_yin
  autocmd!
  autocmd ColorScheme yin call FixColorschemeYin()
augroup END
call FixColorschemeYin()

"## editorconfig/editorconfig-vim
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

"## junegunn/gv.vim
" PROS:
"   - Mais facil de pesquisar pelo titulo do commit
"   - Clicar no commit permite ver sua descrição e diff

"## diepm/vim-rest-console
" PROS:
"   - Falicita MUITO programar apis REST
"   - 'Documenta' as requisições da api
"       - TODO ver como utilizar $VARIAVEIS no Windows

" Instruções:
"   - ]] [[ navega entre blocos de requisição
"   - usar <c-j> no bloco da requisição

" quando não indicado nas opções de curl "-i" para informar o tipo de retorno,
" por padrão é json (afinal usarei como rest client somente)
let g:vrc_response_default_content_type = 'application/json'

" troca <c-j> pois uso com split
let g:vrc_trigger = '<C-x>'

"## vim-vdebug/vdebug
" PROS:
"   - Unico debug pra vim
"   - Suporte para multiplas linguagens
"
" CONS:
"   - Necessita de Python3

" XDEBUG:
"   - Acessar: https://xdebug.org/wizard
"   - Baixar dll ou so indicado e salvar em /path/to/php/ext ou
"   /path/to/php/ext/ext
"   - Adicionar no php.ini
"   [xdebug]
"   zend_extension="/path/to/php/ext/xdebug.so" (.so ou .dll)
"   xdebug.remote_enable=on
"   xdebug.remote_handler=dbgp
"   xdebug.remote_host=localhost
"   xdebug.remote_port=9000

" COMANDOS:
"    <F5>: inicia/vai para o proximo breakpoint
"    <F2>: avança um passo
"    <F3>/<F4>: entra/sai um passo
"    <F6>: para debug (kills script)
"    <F6><F6>: para o debug e fecha a interface do VDebug
"    <F9>: avança até o cursor
"    <F10>: toggle breakpoint
"    <F11>: mostra variáveis de contexto
"    <F12>: mostra variável abaixo do cursor
"    :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
"    :VdebugEval "<code>": evaluate some code and display the result

" Evita erro de DeprecationWarning: the imp module is deprecated in favour of
" importlib; see the module's documentation for alternative uses
" THANKS: https://github.com/powerline/powerline/issues/1925#issuecomment-402635097
" Necessário configurar:
" set pythonthreehome=~/AppData/Local/Programs/Python/Python38-32
" set pythonthreedll=~/AppData/Local/Programs/Python/Python38-32/python38.dll
"if has('python3')
"  silent! python3 1
"  packadd! vdebug
"endif

" script proposto para criar a sessão do xdebug
" #!/bin/bash
" export XDEBUG_CONFIG="idekey=xdebug"
" php "$@"

