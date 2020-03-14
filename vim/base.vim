" vim: set fo+=t:
"
" Arquivo de configurações básicas do vim, podendo ser adicionado
" de maneira independente do repo dotfiles. Basta copiar o conteúdo para
" o arquivo %userprofile%\_vimrc no Windows ou em $HOME/.vimrc no Linux.
" - https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/base.vim
"
" Livros abertos sobre vim:
" - https://vimbook.gitbook.io/vimbook/
" - https://sedilson.github.io/vimparanoobs/index.html
"
" Este arquivo utiliza os folds do vim, abaixo um resumo de como usar (:h folds):
" - https://vim.fandom.com/wiki/Folding
" - https://pt.wikibooks.org/wiki/Vim/Usando_folders
" - https://www.linux.com/tutorials/vim-tips-folding-fun/
"
" zj zk pulo de fold
" [z ]z gg G de um fold aberto
"
"|             | primeiro nivel |  recursivo  |
"|-------------|----------------|-------------|
"|todo arquivo |     zr/zm      |  zR/zM (F2) |
"|             |   reduce/more  | reduce/more |
"|-------------|----------------|-------------|
"|sob o cursor |   zo/zc ou za  | zO/zC ou zA |
"
" dotfiles interessantes:
" - https://github.com/tpope/tpope
" - https://github.com/woliveiras/dotfiles/blob/master/bin/system-settings/.vimrc
"
" DICAS:
"   - Usar K (:h K) em cima da palavra da configuração para consultar manual
"   - propriedades que são setadas podem voltar ao seu valor inicial com &,
"   por exemplo set wildmenu&
"
"## Buffers
" Motivos para usar buffer ao invés de tabs:
"   - O mesmo arquivo não é aberto duas vezes
"   - Mais velocidade pois a janela não precisa ser redesenhada

set hidden " mantêm o arquivo disponível ao sair dele (mesmo modificado)
" :ls lista os buffers
"## Aparência e som
syntax on                   " syntax de acordo com o filetype
filetype plugin indent on   " carrega ftplugin.vim e indent.vim do runtimepath (plugins)
set background=dark         " ajusta cores para um fundo escuro
colorscheme slate           " tema de cores slate (junto com vim) para syntax
set number relativenumber   " exibe régua com o numero relativo das linhas
set showmatch               " mostra fechamento de {[()]}
set autoindent              " auto indentação
set mouse=a                 " libera uso do mouse em todos modos
set linebreak               " quebra a linha por palavra e não por letra
set cursorcolumn cursorline " marca colunha e linha do cursor
set showcmd                 " mostra os comandos no canto inferior direito

" Limite de coluna, comentado para ser posto em modelines específicas
" set textwidth=80            " define largura da linha de texto
" set formatoptions+=t        " quebra a linha na coluna textwidth (Vgq)
set colorcolumn=81          " marca coluna 81

" Remove som ao apertar multiplos ESCs
" https://vim.fandom.com/wiki/Disable_beeping"
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set belloff+=ctrlg                      " if Vim beeps during completion
"Obs: para o gvim editar o _gvimrc (windows) ou .gvimrc (linux)
"## Modeline
set modeline        " habilita uso da modeline
set modelines=5     " procura as 5 primeiras ou ultimas linhas do arquivo
" Exemplo de modeline:
" vim: set fdm=marker:
"## Statusline
set laststatus=2                " habilita statusline
set statusline=                 " reseta statusline
set statusline+=\ %r\%m\%f\     " nome readonly, modificado e nome abreviado
set statusline+=\%=				" espaço
set statusline+=\ %p%%\ %l:\%c  " rownumber, total e percentual
"## Popup de sugestão
set wildmenu                            " habilita menu
set completeopt=menuone                 " mostra menu de opções
set shortmess+=c                        " remove mensagens inúteis do wildmenu
set omnifunc=syntaxcomplete#Complete    " c-x c-o pelo filetype do buffer aberto
set complete=.,k,w,b                    " add sugestão do wildmenu, tags pesam muito
"## Conteúdo do buffer aberto
set encoding=utf-8
"set fileencoding=utf-8 "?
"set fileencodings=utf-8 "?
set fileformats=unix,dos,mac
"set bomb "?
"set binary "?
set nrformats-=octal            " ctrl-a ctrl -x

set nobackup    " para não criar arquivo de bkp
set noswapfile  " para não criar arquivo swap

" Checar quando o texto for modificado
set autoread
au FocusGained,BufEnter * :silent!<space>!

" Permite usar <bs> mesmo indo contra auto-intent, eol e inicio da linha
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start
"### Tabs/espaços
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
"## Pesquisa no buffer aberto
set hlsearch    " colore os matches
set incsearch   " vai colorindo a pesquisa durante a digitação
set ignorecase  " ignora case sensitive na busca
"## Fold
function! FoldTextHashtag()
    let nl = v:foldend - v:foldstart + 1
    let titulo = substitute(getline(v:foldstart),"^\""," ",'g')
    let titulo = substitute(titulo,"\ ","",'')
    let titulo = substitute(titulo,"\#","\ ",'g')
    "let txt = '+ (' . nl . ')' . titulo . ' '
    let txt = '+' . titulo . ' (' . nl . ') '
    return txt
endfunction
"### Markdown
function! FoldMarkdown()
    if getline(v:lnum) =~ '^## .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">5"
    endif
    return "=" 
endfunction

au FileType markdown set foldexpr=FoldMarkdown()  
au FileType markdown set foldmethod=expr
au FileType markdown set foldtext=FoldTextHashtag()
"":lvimgrep /^"#/ % | lw
"### VimScript
function! FoldVimScript()
    if getline(v:lnum) =~ '^"## .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^"### .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^"#### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^"##### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^"###### .*$'
        return ">5"
    endif
    return "=" 
endfunction
" https://stackoverflow.com/questions/5983396/change-the-text-in-folds
" https://jdhao.github.io/2019/08/16/nvim_config_folding/

au FileType vim set foldexpr=FoldVimScript()
au FileType vim set foldmethod=expr
au FileType vim set foldtext=FoldTextHashtag()
"## Netrw
" Como não criar NetrwTreeListing e .netrwhist?
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
let g:netrw_liststyle=3     " tree view

"https://stackoverflow.com/a/8731175
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
"## Declaração de funções (macros)
" Créditos: https://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
fun! Dos2unix()
    " Don't strip on these filetypes
    " :echo &ft
    if &ft =~ 'startify\|nerdtree'
        return
    endif
    :e ++ff=dos
endfun

" Função utilizada para limpar a tela do terminal
" Dependendo do SO muda o comando...
fun LimpaTerminal()
    if has("win32")
        silent !cls
    else
        silent !clear
    endif
endfun
"## Mapeamentos/Comandos e abreviações (macros)
":map -> lista todos mapeamentos para o arquivo

let mapleader="\<space>"

" Identa todo arquivo e volta ao ponto de partida
nnoremap <C-S> mi<esc>gg=G`i

" Mostra o diretório corrente, raiz para acessar arquivos com :e
noremap <leader>. :pwd<CR>

" Mais ergonômico
inoremap <c-f> <c-o>
inoremap kj <esc>
autocmd InsertEnter * set timeoutlen=200
autocmd InsertLeave * set timeoutlen=1000
"### Salvar/sair rapidamente
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
"### Undo/redo
nnoremap <c-z> u
" re do with <C-R> built-in
"### Fold
nnoremap <silent> <tab> za
" reduz/mostra conteudo dos folds
nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
"### Buffers
" View and select buffers
" CtrlP possui a mesma feature
"nnoremap <Tab> :ls <CR>:b<space>

" Fechar (sem forçar) todos buffers e deixar somente um
" Créditos: https://salferrarello.com/vim-close-all-buffers-except-the-current-one/
command! BufOnly execute 'kb|%bdelete|e #|b#|bd%|normal `b'

" Créditos: https://stackoverflow.com/a/38082196
command! TerminalGitRoot exec 'cd' fnameescape(fnamemodify(finddir('.git',
            \ escape(expand('%:p:h'), ' ') . ';'), ':h'))
            \ '|term'

" Open new file in buffer
" Atualmente é mais eficar usar ctrlp, mas o truque é top
" nnoremap <c-n> :e **/*

" Deleção de buffers
nnoremap <silent> <leader>dd :bd<CR>
nnoremap <silent> <leader>df :bd!<CR>

" Troca de buffers
"nnoremap <Tab> :bn<CR>
"nnoremap <S-Tab> :bp<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [B :bp<CR>
nnoremap <silent> ]B :bn<CR>
"### Cursor
cnoreabbrev cul set cul
cnoreabbrev nocul set nocul
"### Pesquisa no arquivo
" Centralizar resultados
nnoremap n nzzzv
nnoremap N Nzzzv

" Limpa highlight da pesquisa
nnoremap <leader>/ :noh<cr>
"### Remove utilização de setas
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>
"### Git greps
" Créditos: https://www.commandlinefu.com/commands/view/12833/get-a-list-of-all-todofixme-tasks-left-to-be-done-in-your-project
"":lvimgrep /\[ \]/ % | lw
command Tasks !git grep -EIn "TODO|FIXME"'
"### CTAGS
" Necessario instalar ctags ou universal ctags
" Att ctags
command Ctags !ctags -R .<CR>

" Goto definition
nnoremap <leader>t :tn <c-r><c-w><CR>
"### Split
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
"## Copy paste
set clipboard=unnamed
noremap <leader>y my^vg_"+y:echo "Copiado!!"<CR>
vnoremap <leader>y "+y:echo "Copiado!!"<CR>
"## Configuração específicas de sistema operacional
""autocmd BufRead * call Dos2unix()
"## Comandos/configurações específicas do buffer aberto
" Créditos: https://stackoverflow.com/a/24046914
let s:comment_map = { 
            \   "c": '\/\/',
            \   "cpp": '\/\/',
            \   "dot": '\/\/',
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

"### HTML
augroup html
    " Créditos: https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/drwd5lx/
    " <c-n> é necessário quando complete opt possui noselect
    au FileType html inoremap <buffer> <c-t> </<c-x><c-o><c-n><esc>==gi
    " Comenta
    au FileType html vnoremap // I<!--<esc>A--><CR>
    au FileType html vnoremap /; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
    au FileType html nmap // I<!--<esc>A--><CR>
    au FileType html nmap /; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
augroup END
"### SVELTE
augroup svelte
    au BufReadPost *.svelte set syntax=html
augroup END

"### MARKDOWN
"augroup markdown
"augroup END
"### DOT GV
au! BufRead,BufNewFile *.gv setfiletype dot
augroup dot
    au FileType dot nmap <leader>r <Esc>:w<CR>:call LimpaTerminal()<CR>:!dot -Tpdf -O %<CR><CR>
    au FileType dot nmap <leader>i <Esc>:w<CR>:call LimpaTerminal()<CR>:!dot -Tpng % -O<CR><CR>
augroup END
"### SHELL
"augroup sh
"augroup END
"### LATEX
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
"### PYTHON
augroup python
    au FileType python nmap <leader>r :vsp<CR>:terminal python3 %<CR>
augroup END
"### PHP
augroup php
    " https://vim.fandom.com/wiki/Runtime_syntax_check_for_php
    " Para usar o :make % e ver erro de syntax
    au FileType php compiler php
    au FileType php set errorformat=%m\

    " Map para executar comando de teste do composer
    " echo "<?php system('composer test');" > neni-composer-test.php
    au FileType php nmap <leader>ct :terminal php neni-composer-test.php<CR>

    au FileType php nmap <leader>r :terminal php %<CR>
augroup END
"### JAVASCRIPT
"augroup javascript
"augroup END
"### Netrw
" Netrw no lugar do nerdtree
" Toggle diretórios à esquerda
"noremap <leader><CR> :Lexplore<CR>

" Configura para apagar o buffer vazio deixado pelo :Lexplore, thanks tpope
au Filetype netrw setl bufhidden=delete
