" Este arquivo utiliza os folds do vim, abaixo um resumo de como usar (:h folds)
"
" https://vim.fandom.com/wiki/Folding
" https://pt.wikibooks.org/wiki/Vim/Usando_folders
" https://www.linux.com/tutorials/vim-tips-folding-fun/
"
" https://vimbook.gitbook.io/vimbook/
" https://sedilson.github.io/vimparanoobs/index.html
"
" zj zk pulo de fold
" [z ]z gg G de um fold aberto
"
"                ABRE/FECHA ou TOGGLE
"                | primeiro nivel    | recursivo
" ----------------------------------------------------
" todo arquivo   |       zr/zm       | zR/zM (F2)
"                |    reduce/more    | Reduce/More
" ----------------------------------------------------
" sob o cursor   |  za ou zo/zc     |  zA ou zO/zC
" 
"
"
" Dica: Usar K (:h K em cima da configuração para consultar manual)
" mksession? Usar para substituir bookmarks
" Ver esses plugins
" dotfiles tpope: https://github.com/tpope/tpope || https://github.com/woliveiras/dotfiles/blob/master/bin/system-settings/.vimrc
" nnoremap ,html :-1read $HOMEPATH/.vim/skeleton/html<CR>3jwf>a
" https://stackoverflow.com/questions/3828606/vim-markdown-folding
"# Configurações de variáveis
let mapleader="\<space>"
"## Modeline
set modeline
set modelines=4
" Exemplo de modeline:
" vim: set fdm=marker:
"## Statusline
set laststatus=2
set statusline=
set statusline+=\ %r\%m\%f\ 	                " Nome readonly, modificado e nome abreviado
set statusline+=\%=						        " Espaço
set statusline+=\ %p%%\ %l:\%c                  " Rownumber, total e percentual
"## Visual Settings
syntax on                               " Required for plugins
filetype plugin indent on               " Required for plugins
set relativenumber                      " Distancias entre a linha do cursor
set number                              " Numero das linhas
set showmatch                           " Mostra fechamento de {['']}
set autoindent                          " Auto indentação -> ==
set mouse=a                             " Libera uso do mouse em todos modos
set linebreak                           " Quebra a linha por palavra e não por letra

" Checar quando o texto for modificado
set autoread
au FocusGained,BufEnter * :silent!<space>!

" Para encontrar mais facilmente o cursor
set cursorcolumn
set cursorline

" Remove som ao apertar multiplos ESCs
" https://vim.fandom.com/wiki/Disable_beeping"
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Obs: para o gvim editar o _gvimrc (windows) ou .gvimrc (linux)
"## Popup e omni
set wildmenu
set wildmode=list:full
set completeopt=menuone                 " mostrar menu de opções
"set completeopt+=noselect,noinsert      " Não selecionar nem aceitar instantaneamente o texto (c-n apenas abre opções)
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
"""set wildchar=<Tab>                      " (default)
set omnifunc=syntaxcomplete#Complete    " ctrl-x ctrl-o
set complete=.,w,b,u,t                  " sugestões
"## Sistema Operacional
"### Linux
"### Windows
" Créditos: https://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
fun! Dos2unix()
    " Don't strip on these filetypes
    " :echo &ft
    if &ft =~ 'startify\|nerdtree'
        return
    endif
    :e ++ff=dos
endfun

""autocmd BufRead * call Dos2unix()
"## Encoding
set encoding=utf-8
"set fileencoding=utf-8 "?
"set fileencodings=utf-8 "?
"set bomb "?
"set binary "?
set nrformats-=octal            " ctrl-a ctrl -x

" Permite usar <bs> mesmo indo contra auto-intent, eol e inicio da linha
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start
"## Tabs
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"## Searching
set hlsearch " Colore os matches
set incsearch " Vai colorindo a pesquisa durante a digitação
set ignorecase
"set smartcase
set smarttab
" Directories for swp files
set nobackup
set noswapfile
set fileformats=unix,dos,mac

" Delay entre atalhos
"set ttimeout
"set ttimeoutlen=100
"set timeoutlen=3000
"## Copy paste
set clipboard=unnamed
noremap <leader>y V"+y:echo "Copiado!!"<CR>
vnoremap <leader>y "+y:echo "Copiado!!"<CR>
" Mostra os comandos no canto inferior direito
set showcmd
"## Fold
" Retem folds
" Causa erro no windows caso a view não exista
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
" https://stackoverflow.com/questions/3828606/vim-markdown-folding
"":lvimgrep /^"#/ % | lw
"### Markdown
function! FoldMarkdown()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
au FileType markdown set foldexpr=FoldMarkdown()  
set foldmethod=expr
"### VimScript
function! FoldVimScript()
    if getline(v:lnum) =~ '^"# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^"## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^"### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^"#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^"##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^"###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
" https://stackoverflow.com/questions/5983396/change-the-text-in-folds
" https://jdhao.github.io/2019/08/16/nvim_config_folding/
function! FoldTextVimScript()
    let nl = v:foldend - v:foldstart + 1
    let titulo = substitute(getline(v:foldstart),"^\"#*","",'g')
    let titulo = substitute(getline(v:foldstart),"^\"","",'g')
    "let txt = '+ (' . nl . ')' . titulo . ' '
    let txt = titulo . ' (' . nl . ') '
    return txt
endfunction

au FileType vim set foldexpr=FoldVimScript()
au FileType vim set foldmethod=expr
"au FileType vim set foldexpr=FoldVimScript()
set foldtext=FoldTextVimScript()
"## Netrw
" Como não criar NetrwTreeListing e .netrwhist?
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_liststyle=3     " tree view
"## Funções
" Função utilizada para limpar a tela do terminal
" Dependendo do SO muda o comando...
fun LimpaTerminal()
    if has("win32")
        silent !cls
    else
        silent !clear
    endif
endfun

"## Dicionários
"set complete+=k
let g:dict_dir = "~/dev/dotfiles/vim/dicionarios/"

"# Linguagens de programação
"## shared

" Créditos: https://stackoverflow.com/a/24046914
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    end
endfunction

nnoremap gcc :call ToggleComment()<cr>
vnoremap gcc :call ToggleComment()<cr>

"## HTML
augroup html
    " Créditos: https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/drwd5lx/
    au FileType html inoremap <buffer> <c-k> </<c-x><c-o><c-n><esc>==gi
    " Comenta
    au BufNewFile *.html 0r ~/dev/dotfiles/vim/skeletons/skeleton.html
    au FileType html vnoremap // I<!--<esc>A--><CR>
    au FileType html vnoremap /; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
    au FileType html nmap // I<!--<esc>A--><CR>
    au FileType html nmap /; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
"    au FileType html :so ~/dev/dotfiles/vim/plugins/matchit.vim
augroup END
"## SVELTE
augroup svelte
    au BufReadPost *.svelte set syntax=html
augroup END

"### MARKDOWN
"augroup markdown
"    " Converte arquivo file.md atual em file.md.pdf
"    au FileType markdown nmap <leader>r <Esc>:w<CR>:!clear;pandoc % -o %.pdf<CR><CR>
"    " Abre file.md.pdf com comando comando $PDFVIEWER
"    au FileType markdown nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
"augroup END
"## DOT GV
au! BufRead,BufNewFile *.gv       setfiletype dot
augroup dot
    au FileType dot nmap <leader>r <Esc>:w<CR>:call LimpaTerminal()<CR>:!dot -Tpdf -O %<CR><CR>
    au FileType dot nmap <leader>i <Esc>:w<CR>:call LimpaTerminal()<CR>:!dot -Tpng % -O<CR><CR>
    au FileType dot nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
    au FileType dot imap >> <SPACE>-><SPACE>
"augroup END
"## SHELL
"augroup sh
"    au BufNewFile *.sh 0r ~/dev/dotfiles/vim/skeletons/skeleton.sh
"    au FileType sh nmap <leader>r <Esc>:w<CR>:!clear;chmod +x % ; ./%<CR>
"augroup END
"## LATEX
"augroup tex
"    " Comenta
"    " É necessário compilar duas vezes para ter certeza de atualizar a toc
"    " https://tex.stackexchange.com/questions/301103/empty-table-of-contents
"    " Também compilar bibliografia e mais uma vez a toc
"    " Erros salvos em log
"    au FileType tex nmap <leader>r <Esc>:w<CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;bibtex '%:r' > bibtex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>
"    au FileType tex nmap <leader>e <Esc>:!clear;$PDFVIEWER '%:r'.pdf &<CR><CR>
"augroup END
"
"" Reconhecer classes com syntax de latex
"au BufNewFile,BufRead *.cls set filetype=tex
"## PYTHON
augroup python
    au FileType python nmap <leader>r :vsp<CR>:terminal python3 %<CR>
"    au FileType python vnoremap // :call ComentaVisual("# ", "")<CR>
"    au FileType python vnoremap /; :s/#\s/<CR>:noh<CR>
"    au FileType python nmap // :call ComentaNormal("# ", "")<esc>
"    au FileType python nmap /; :s/#\s/<CR>:noh<CR>
augroup END
"## PHP
augroup php
    " https://vim.fandom.com/wiki/Runtime_syntax_check_for_php
    "au QuickFixCmdPre make w
    au FileType php compiler php
    "au BufWritePost *.php make %
    au FileType php set errorformat=%m\
    au BufNewFile *.php 0r ~/dev/dotfiles/vim/skeletons/skeleton.php
    au BufNewFile phpunit.xml 0r ~/dev/dotfiles/vim/skeletons/phpunit.xml
    au FileType php nmap <leader>r :terminal php %<CR>

    " Dicionarios (c-x c-k) pois o ctags ainda é meio bugado
    let dict_phpunit = g:dict_dir . "phpunit.txt"
    au BufRead *test.php execute "setlocal dictionary+=".dict_phpunit
augroup END
"## JAVASCRIPT
"augroup javascript
"    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"augroup END
"# Mapeamentos/Comandos e abreviações de comandos
":map -> lista todos mapeamentos para o arquivo
" Indent all file and go back
nnoremap <C-S> i<++><esc>gg=G/<++>/<CR>v/><CR>d==:noh<CR>
noremap <leader>. :pwd<CR>
" Mais fácil de teclar
inoremap <c-f> <c-o>
"## Write/quit rapidamente
noremap <leader><leader> :w<CR>
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev QA! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
"## Undo/redo
nnoremap <C-Z> u
nnoremap <C-z> u
" re do with <C-R> built-in
"## Fold
nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
"## Buffers
" Use buffers instead tabs
"   the same file dont open twice
"   more velocity

" View and select buffers
" CtrlP possui a mesma feature
"nnoremap <Tab> :ls <CR>:b<space>

" Fechar todos buffers e deixar somente um
" Somente buffers sem conteúdo por salvar são fechados
" Créditos: https://salferrarello.com/vim-close-all-buffers-except-the-current-one/
" nnoremap <c-n> :%bd | e # | b # | q<CR>
command! BufOnly execute 'kb|%bdelete|e #|b#|bd%|normal `b'

" Créditos: https://stackoverflow.com/a/38082196
command! TerminalGitRoot exec 'cd' fnameescape(fnamemodify(finddir('.git',
    \ escape(expand('%:p:h'), ' ') . ';'), ':h'))
    \ '|term'

" Leave a buffer even without save
set hidden

" Open new file in buffer
" Atualmente é mais eficar usar ctrlp, mas o truque é top
" nnoremap <c-n> :e **/*

" Deleção de buffers
nnoremap <silent> <leader>dd :bd<CR>
nnoremap <silent> <leader>df :bd!<CR>

" Troca debuffers
"nnoremap <Tab> :bn<CR>
"nnoremap <S-Tab> :bp<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [B :bp<CR>
nnoremap <silent> ]B :bn<CR>
"## Cursor
cnoreabbrev cul set cul
cnoreabbrev nocul set nocul
"## Fechar automaticamente [ { ( " ' ' " ) } ]
" Melhorar o <left><left>......, vimrc não reconhece comando de leader para {~~}
" Muito cansativo usar a regra de quebrar linha no {} e rever em outros para não fazer
inoremap {<CR> {}<left><CR><Esc>O
inoremap {<space> {}<left><space><space><left>
inoremap { {}<left>

inoremap (<CR> ()<left><CR><Esc>O
inoremap (<space> ()<left><space><space><left>
inoremap ( ()<left>

inoremap [<CR> []<left><CR><Esc>O
inoremap [<space> []<left><space><space><left>
inoremap [ []<left>

inoremap " ""<left>
inoremap ' ''<left>
"## surround
"xnoremap ( xi()<ESC>P
"xnoremap { xi{}<ESC>P
"xnoremap [ xi[]<ESC>P
"xnoremap " xi""<ESC>P
"xnoremap ' xi''<ESC>P
vnoremap <silent> ' c'<c-r>"'
vnoremap <silent> " c"<c-r>""
vnoremap <silent> ( c(<c-r>")
vnoremap <silent> { c{<c-r>"}
vnoremap <silent> [ c[<c-r>"]
"## Pesquisa no arquivo
" Centralizar resultados
nnoremap n nzzzv
nnoremap N Nzzzv
" Clean search (highlight)
nnoremap <leader>/ :noh<cr>
"## Remove utilização de setas
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
"## Git greps
" créditos: https://www.commandlinefu.com/commands/view/12833/get-a-list-of-all-todofixme-tasks-left-to-be-done-in-your-project
"":lvimgrep /\[ \]/ % | lw
command Tasks !git grep -EIn "TODO|FIXME"'
"## Netrw
" Netrw no lugar do nerdtree
" Toggle diretórios à esquerda
"noremap <leader><CR> :Lexplore<CR>

" Configura para apagar o buffer vazio deixado pelo :Lexplore, thanks tpope
au Filetype netrw setl bufhidden=delete
"## CTAGS
" Necessario instalar ctags ou universal ctags
" Att ctags
command Ctags !ctags -R .<CR>

" Goto definition
nnoremap <leader>t :tn <c-r><c-w><CR>
"## Split
" Open the same file
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>
" Search an file
noremap <leader>l :<C-u>vsp
noremap <leader>j :<C-u>sp

" Switching windows
"   Igual ao dwm
noremap <c-j> <C-w>w
noremap <c-k> <C-w>W

" Resize
nmap <C-w>j <C-w>-
nmap <c-w>k <C-w>+
nmap <c-w>l <C-w>>
nmap <c-w>h <C-w><

" Close all splits
noremap <Leader>e :on<CR>
"## Snippets
" :ia
highlight link NeniTagJump DiffAdd
match NeniTagJump /<++>/

function JumpToTag()
    " search retorna a linha onde o parametro foi encontrado
    if search("<++>",'nw') > 0
        " posiciona o cursor sob o padrão da marcação
        call search("<++>",'w')
        " Caso a marcação esteja na ultima coluna da linha, o :startinsert
        " recua uma coluna a mais. Como seria muito complexo calcular essa
        " situação, é mais fácil entrar no modo de insert e apagar o numero
        " de letras (4 para <++>)
        call feedkeys("i\<del>\<del>\<del>\<del>")
    endif
endfun
inoremap <c-tab> <esc>:call JumpToTag()<cr>
nnoremap <c-tab> <esc>:call JumpToTag()<cr>

" Cancela autotrigger snippet com qualquer "non-keyword"
" Créditos: https://stackoverflow.com/questions/36702371/understand-iabbrev-buffer-iff-ifleft
function LeSnippet(root, file)
    let c = nr2char(getchar(0))
    if c == "\<tab>"
        " Assim que a função é chamada o modo é trocado do insert pro normal
        " deslocando o cursor para a direita. Caso não esteja na primeira
        " coluna, ele não se move, afetando a escolha entre i (insert) e a
        " (apend)
        if col(".") == 1
            " Coloca dois marcadores (§):
            " O primeiro demarca o final da linha [l1] (inicio do snippet) e o
            " segundo o inicio da ultima linha [l2] (final do snippet)
            execute "normal i§§"
        else
            " Coloca dois marcadores (§):
            " O primeiro demarca o final da linha [l1] (inicio do snippet) e o
            " segundo o inicio da ultima linha [l2] (final do snippet)
            execute "normal a§§"
        endif
        " Acessa entre os marcadores (§§) e da um enter para quebrar a linha.
        " O marcador preservará o espaço contido antes e depois do mesmo,
        " evitando que o J crie um espaço caso não precise ou unifique caso ja
        " exista
        execute "normal i\<cr>"

        " Marca l2 (mark s) e sobe para a linha inicial
        normal msk

        " Escreve o conteudo do snippet logo abaixo da linha inicial
        execute "read" . a:file

        " - Marca a primeira linha do snippet lido (mark d)
        " - Unifica l1 com a primeira do snippet
        " - Move para esquerda e apaga o espaço gerado pelo J e o marcador (§)
        " - Retorna à l2
        " - Unifica l2 com a ultima do snippet
        " - Apaga o espaço gerado pelo J e o marcador (§) restante
        " - Seleciona de l2 unificada até l1 unificada com o snippet e identa
        normal mdkJhxx`skJxxV`d=
        call JumpToTag()
    elseif c == " " || c == '.' || c == ',' || c == ';'
        " a:root . c vai tornar recursiva a função.
        " É necessário colocar uma letra que não seja non-keyword para depois
        " apagá-la
        execute "normal i" . a:root . 'c' . c
        execute "normal hx"
        startinsert
        call cursor( line('.'), col('.') + 1)
    else
        " a:root . c vai tornar recursiva a função.
        " É necessário colocar uma letra que não seja non-keyword para depois
        " apagá-la
        execute "normal i" . a:root . 'a'
        execute "normal x"
    endif
endfunction

function! CriaSnippet(root, good)
    execute "iabbr <buffer> " . a:root . " <esc>:call LeSnippet(\"" . a:root . "\", \"" . a:good . "\")<cr>"
endfunction

function! RegistraArraySnippets(snippet)
    for key in keys(a:snippet)
        execute CriaSnippet(key, a:snippet[key])
    endfor
endfunction

let s:snippetsDir = '~/dev/dotfiles/vim/snippets/'
let s:snippetsDirPHP = s:snippetsDir . 'php/'
let s:snippets_php_abbreviations = {
            \ 'for': s:snippetsDirPHP.'for.php',
            \ 'fore': s:snippetsDirPHP.'foreach.php',
            \ 'fun': s:snippetsDirPHP.'function.php',
            \ 'if': s:snippetsDirPHP.'if.php',
            \ '-': s:snippetsDirPHP.'private.php',
            \ '#': s:snippetsDirPHP.'protected.php',
            \ '+': s:snippetsDirPHP.'public.php',
            \ 't': s:snippetsDirPHP.'this.php',
            \ 'dd': s:snippetsDirPHP.'var_dump.php',
            \ 'e': s:snippetsDirPHP.'echo.php',
            \ }
let s:snippetsDirJS = s:snippetsDir . 'js/'
let s:snippets_js_abbreviations = {
            \ 'for': s:snippetsDirJS.'for.js',
            \ 'fun': s:snippetsDirJS.'function.js',
            \ 'if': s:snippetsDirJS.'if.js',
            \ 'log': s:snippetsDirJS.'log.js',
            \ }

au FileType php call RegistraArraySnippets(s:snippets_php_abbreviations)
au FileType javascript call RegistraArraySnippets(s:snippets_js_abbreviations)
au FileType html call RegistraArraySnippets(s:snippets_js_abbreviations)



