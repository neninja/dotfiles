" autor: nenitf
" A partir de vim-bootstrap b0a75e4
" motivacional: https://www.youtube.com/watch?v=XA2WjJbmmoM
" TODO:
"   Skeletons para .html phpunit.xml .editorconfig

let mapleader="\<space>"

"*********************************************************
" Vim-PLug core
"*********************************************************
if has('vim_starting')
    set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
endif

if filereadable(expand("~/dev/dotfiles/nvim/.nvimrc.plugs"))
    source ~/dev/dotfiles/nvim/.nvimrc.plugs
endif

" Configurações built-in do nvim

"*********************************************************
" Basic Setup
"*********************************************************
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" autocmd FileType javascript setlocal tabstop=2

" Searching
set hlsearch
set incsearch
":%s"
if has('nvim')
    set inccommand=split 
endif
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile
set fileformats=unix,dos,mac

" Delay entre atalhos
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" Copy paste
set clipboard=unnamed
noremap <leader>y V"+y:echo "Copiado!!"<CR>
vnoremap <leader>y "+y:echo "Copiado!!"<CR>

" Quebra de linha com simbolo
set showbreak=↳\

" Mostra os comandos no canto inferior direito
set showcmd

"-------------------------------------------------
" Popup
"-------------------------------------------------
set wildmenu
set wildmode=list:full
set completeopt=longest,menuone,preview " cool completion view
set completeopt+=noselect               " deixar digitar
set wildchar=<Tab>                      " (default)
set omnifunc=syntaxcomplete#Complete    " ctrl-x ctrl-o
set complete=.,w,b,u,t

"*********************************************************
" Basics Abbreviations/Commands
"*********************************************************
" No one is really happy until you have this shortcuts
cnoreabbrev W! w!
" cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev QA! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
" cnoreabbrev WQ wq
cnoreabbrev W w
" cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa

" Cursor
cnoreabbrev cul set cul
cnoreabbrev nocul set nocul

"*********************************************************
" Mappings
"*********************************************************
" Fechar automaticamente
" Melhorar o <left><left>......, vimrc não reconhece comando de leader para {~~}
" Muito cansativo usar a regra de quebrar linha no {} e rever em outros para não fazer
inoremap {<Tab> {}<left><CR><CR><up><tab>
inoremap {<space> {}<left><space><space><left>
inoremap { {}<left>

inoremap (<Tab> ()<left><CR><CR><up><tab>
inoremap (<space> ()<left><space><space><left>
inoremap ( ()<left>

inoremap [<Tab> []<left><CR><CR><up><tab>
inoremap [<space> []<left><space><space><left>
inoremap [ []<left>

inoremap " ""<left>
inoremap ' ''<left>


" surround
xnoremap ( xi()<ESC>P
xnoremap { xi{}<ESC>P
xnoremap [ xi[]<ESC>P
xnoremap " xi""<ESC>P
xnoremap ' xi''<ESC>P

" j e k mantem cursor no meio do editor
" nnoremap j jzz
" nnoremap k kzz

" Search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Only hjkl
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>


" Acabar com o ctrl z
nnoremap <C-Z> u
nnoremap <C-z> u
" re do with <C-R> built-in

" Close all splits
noremap <Leader>e :on<CR>
" wgy dont work????????
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" Surround
vnoremap <silent> ' c'<c-r>"'
vnoremap <silent> " c"<c-r>""
vnoremap <silent> ( c(<c-r>")
vnoremap <silent> { c{<c-r>"}
vnoremap <silent> [ c[<c-r>"]

" Tabs
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT

" Clean search (highlight)
nnoremap <leader><space> :noh<cr>

" Indent all file and go back
nnoremap <C-S> i<++><esc>gg=G/<++>/<CR>v/><CR>d==:noh<CR>

" Echo local
noremap <Leader>. :pwd<CR>

"-------------------------------------------------
" Split
"-------------------------------------------------
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

"*********************************************************
" Visual Settings
"*********************************************************
syntax on                             " Required for plugins
filetype plugin indent on             " Required for plugins
set relativenumber                    " Distancias entre a linha do cursor
set number                            " Numero das linhas
set showmatch                         " Mostra fechamento de {['']}
set ai                                " Auto indentação -> ==
set mouse=a                           " Libera uso do mouse em todos modos

" Checar quando o texto for modificado
set autoread
au FocusGained,BufEnter * :silent! !

"*********************************************************
" Custom configs langs
"*********************************************************
" Funções para comentar/decomentar linha a linha de código
" Parâmetro deve ser entre aspas e conter, se necessário, espaço e contra-barra
function ComentaNormal(carac)
    execute "normal! I".a:carac
    echo a:carac
endfunction

function ComentaVisual(carac)
    execute "normal! I".a:carac
endfunction

"#########################################
" GO
"#########################################
augroup go
    " Comenta
    au FileType go vnoremap // :call ComentaVisual("// ")<CR>
    au FileType go vnoremap ;; :s/\/\/\s/<CR>:noh<CR>
    au FileType go nmap // :call ComentaNormal("// ")<esc>
    au FileType go nmap ;; :s/\/\/\s/<CR>:noh<CR>
augroup END

"#########################################
" VUE
"#########################################
autocmd BufRead,BufNewFile *.vue setfiletype html

"#########################################
" MARKDOWN
"#########################################
augroup markdown
    " Converte arquivo file.md atual em file.md.pdf
    au FileType markdown nmap <leader>r <Esc>:w<CR>:!clear;pandoc % -o %.pdf<CR><CR>
    " Abre file.md.pdf com comando comando $PDFVIEWER
    au FileType markdown nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
augroup END

"#########################################
" CSV
"#########################################
augroup csv
    " Transforma como md em /tmp, salva, converte em pdf com pandoc em /tmp e fecha buffer; abre pdfviewer
    "au FileType csv nmap <leader>r <Esc>:w<CR>:sav! /tmp/%.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-<ESC>:%s/;/\|/<CR>:w<CR>:!echo /tmp/'%:r'.pdf <CR>
    "au FileType csv nmap <leader>r <Esc>:w<CR>:sav! /tmp/%.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-<ESC>:%s/;/\|/<CR>:w<CR>:!echo /tmp/'%:r'.pdf <CR>
    au FileType csv nmap <leader>r <Esc>:w<CR>:sav! %.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-\|-<ESC>:%s/;/\|/g<CR>:w<CR>:!pandoc % -o '%:r'.pdf<CR><CR>:bd<CR>
    au FileType csv nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
augroup END

"#########################################
" DOT GV
"#########################################
au! BufRead,BufNewFile *.gv       setfiletype dot
augroup dot
    au FileType dot nmap <leader>r <Esc>:w<CR>:!clear;dot -Tpdf -O %<CR><CR>
    au FileType dot nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
    au FileType dot inoremap > <SPACE>-><SPACE>
augroup END

"#########################################
" SHELL
"#########################################
augroup sh
    au FileType sh nmap <leader>r <Esc>:w<CR>:!clear;chmod +x % ; ./%<CR>
augroup END

"#########################################
" LATEX
"#########################################
augroup tex
    " Comenta
    au FileType tex vnoremap // :call ComentaVisual("% ")<CR>
    au FileType tex vnoremap ;; :s/%\s/<CR>:noh<CR>
    au FileType tex nmap // :call ComentaNormal("% ")<esc>
    au FileType tex nmap ;; :s/%\s/<CR>:noh<CR>

    " É necessário compilar duas vezes para ter certeza de atualizar a toc
    " https://tex.stackexchange.com/questions/301103/empty-table-of-contents
    " Também compilar bibliografia e mais uma vez a toc
    " Erros salvos em log
    au FileType tex nmap <leader>r <Esc>:w<CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;bibtex '%:r' > bibtex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>
    au FileType tex nmap <leader>e <Esc>:!clear;$PDFVIEWER '%:r'.pdf &<CR><CR>
augroup END

" Reconhecer classes com syntax de latex
au BufNewFile,BufRead *.cls set filetype=tex

"#########################################
" PYTHON
"#########################################
augroup python
    au FileType python nmap <leader>r :vsp<CR>:terminal python3 %<CR>
    au FileType python vnoremap // :call ComentaVisual("# ")<CR>
    au FileType python vnoremap ;; :s/#\s/<CR>:noh<CR>
    au FileType python nmap // :call ComentaNormal("# ")<esc>
    au FileType python nmap ;; :s/#\s/<CR>:noh<CR>
augroup END

"#########################################
" PHP
"#########################################
augroup python
    au FileType php nmap <leader>r :vsp<CR>:terminal php %<CR>
    au FileType php vnoremap // :call ComentaVisual("// ")<CR>
    au FileType php vnoremap ;; :s/\/\/\s/<CR>:noh<CR>
    au FileType php nmap // :call ComentaNormal("// ")<esc>
    au FileType php nmap ;; :s/\/\/\s/<CR>:noh<CR>
augroup END

"#########################################
" JAVASCRIPT
"#########################################
augroup javascript
    au FileType javascript vnoremap // :call ComentaVisual("// ")<CR>
    au FileType javascript vnoremap ;; :s/\/\/\s/<CR>:noh<CR>
    au FileType javascript nmap // :call ComentaNormal("// ")<esc>
    au FileType javascript nmap ;; :s/\/\/\s/<CR>:noh<CR>
augroup END

"#########################################
" VIMSCRIPT
"#########################################
augroup vim
    au FileType vim vnoremap // :call ComentaVisual("\" ")<CR>
    au FileType vim nmap // :call ComentaNormal("\" ")<esc>
augroup END

"*********************************************************
" Buffers
"*********************************************************
" Use buffers instead tabs
"   the same file dont open twice
"   more velocity
" View and select buffers
nnoremap <Tab> :ls <CR>:b<space>
"nnoremap <Tab> :bn<CR>
"nnoremap <S-Tab> :bp<CR>

" Fechar todos buffers e deixar somente um
" Somente buffers sem conteúdo por salvar são fechados
" https://salferrarello.com/vim-close-all-buffers-except-the-current-one/
" nnoremap <c-n> :%bd | e # | b # | q<CR>
command! BufOnly execute '%bdelete|e #|b#|bd%|normal `"'
" cnoreabbrev bo BufOnly

" Leave a buffer even without save
set hidden

" Open new file in buffer
nnoremap <c-n> :e **/*

nnoremap <silent> <leader>dd :bd<cr>
nnoremap <silent> <leader>df :bd!<cr>

nnoremap <silent> [b :bp<CR>
nnoremap <silent> <Space>[ :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> <Space>] :bn<CR>
nnoremap <silent> [B :bp<CR>
nnoremap <silent> ]B :bn<CR>

" https://www.reddit.com/r/vim/comments/3hwall/how_to_close_vim_when_last_buffer_is_deleted/
function! QuitBuffOrWindow(bang)
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         if(a:bang == "!")
             :q!
         else
             :q
         endif
     else
         if(a:bang == "!")
             :bdelete!
         else
             :bdelete
         endif
    endif
endfunction
function! QuitWriteBuffOrWindow()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :wq
     else
         :w
         :bdelete
    endif
endfunction

command WQ execute ":call QuitWriteBuffOrWindow()"
command -bang Q :call QuitBuffOrWindow("<bang>")
cnoreabbrev q Q
cnoreabbrev wq WQ

"*********************************************************
" Conceal
"*********************************************************
" BUG de duplicar quando escrito function em markdown
" PRECISO DESCROBRIR:
"   COMO EVITAR QE A COR DE CONCEAL SOBSCREVA OUTRAS SYNTAXES:
"       SE -> ESTÁ EM STRING, DEVE TER COR DE STRING
"       SE EM COMENTÁRIO, COMO COMENTÁRIO
"   PORQUE ALGUNS SIMBOLOS CONCEAL DUPLICAM?

" Semelhante a ligatures do firacode!
" Conceal utiliza os digraphs do vim, e els ficam isiveis somente em
" edição/visualização. O arquivo fonte não é modificado com os simbolos.
" Simbolos do vim -> :h digraphtable
" https://vi.stackexchange.com/questions/5696/adding-conceal-to-already-existing-syntax-highlighting
" https://alok.github.io/2018/05/09/more-about-vim-conceal/
" https://www.maximewack.com/post/emulating_ligatures/
" https://www.reddit.com/r/vim/comments/bd0y01/use_matchadd_conceal_function_problem/

" hide in normal and visual mode

set concealcursor=
set conceallevel=2

" Cor de chars modificados
" hi Conceal guibg=NONE guifg=white gui=bold ctermfg=white ctermbg=NONE cterm=bold

" Por algum motivo, o primeiro match é o responsável por match search
" matchadd é usado pois somente :syn não pode especificar prioridade
" matchadd as vezes repete o digraph
" call matchadd('String', '-------:------', 10, 200, {'conceal': 'a'})
" augroup javascript
    " au FileType javascript call matchadd('Conceal','true',0,-1,{'conceal':'✓'})
    " au FileType javascript call matchadd('Conceal','false',0,-1,{'conceal':'×'})
    " au FileType javascript call matchadd('Conceal','\<await\>',0,-1,{'conceal':'↺'})
    " au FileType javascript call matchadd('Conceal','\<async\>',0,-1,{'conceal':'⇄'})
    " au FileType javascript call matchadd('Conceal','\<function\>',0,-1,{'conceal':'ƒ'})
    " au FileType javascript call matchadd('Conceal','\<return\>',0,-1,{'conceal':'↖'})
    " au FileType javascript call matchadd('Conceal','\<null\>',0,-1,{'conceal':'ø'})
    " au FileType javascript call matchadd('Conceal','\<undefined\>',0,-1,{'conceal':'¿'})
    " au FileType javascript call matchadd('Conceal','=>',0,-1,{'conceal':'→'})
    "au BufEnter *.js :syn match Conceal 'true' contained conceal cchar=✓
    "au BufEnter *.js :syn match Conceal 'false' contained conceal cchar=×
    "au BufEnter *.js :syn match Conceal '\<await\>' conceal cchar=↺
    "au BufEnter *.js :syn match Conceal 'async' conceal cchar=⇄

    " au BufEnter *.js :syn match Conceal '<=' conceal cchar=≤
    " au BufEnter *.js :syn match Conceal '>=' conceal cchar=≥
    " au BufEnter *.js :syn match Conceal '!=' conceal cchar=≠
    " au BufEnter *.js :syn match Conceal '==' conceal cchar=≡

    "au FileType javascript call matchadd('Conceal','<=',10,-1,{'conceal':'≤'})
    "au FileType javascript call matchadd('Conceal','>=',10,-1,{'conceal':'≥'})
    "au FileType javascript call matchadd('Conceal','!=',10,-1,{'conceal':'≠'})
    "au FileType javascript call matchadd('Conceal','==',10,-1,{'conceal':'≡'})
" augroup END
" augroup go
    " au FileType go call matchadd('Conceal','true',0,-1,{'conceal':'✓'})
    " au FileType go call matchadd('Conceal','false',0,-1,{'conceal':'×'})
    " au FileType go call matchadd('Conceal','\<nil\>',0,-1,{'conceal':'ø'})
    " au FileType go call matchadd('Conceal','\<func\>',0,-1,{'conceal':'ƒ'})
    " au FileType go call matchadd('Conceal','\<go\>',0,-1,{'conceal':'⇄'})

    "au FileType go call matchadd('Conceal','->',0,-1,{'conceal':'→'})
    "au FileType go call matchadd('Conceal','<-',0, -1,{'conceal':'←'})
    " au BufEnter *.go :syn match Conceal '->' conceal cchar=→
    " au BufEnter *.go :syn match Conceal '<-' conceal cchar=←

    " au BufEnter *.go :syn match Conceal '<=' conceal cchar=≤
    " au BufEnter *.go :syn match Conceal '>=' conceal cchar=≥
    " au BufEnter *.go :syn match Conceal '!=' conceal cchar=≠
    " au BufEnter *.go :syn match Conceal '==' conceal cchar=≡
" augroup END

" function! ToggleConcealLevel()
    " if &conceallevel == 0
        " setlocal conceallevel=2
    " else
        " setlocal conceallevel=0
    " endif
" endfunction

" diminui nivel conceal caso queira...
" nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>

"*********************************************************
" Commit configs
"*********************************************************
"augroup gitsetup
"  autocmd!
"  au FileType gitcommit syn clear gitcommitSummary
"  " Char maximo pro título do commit
"  au FileType gitcommit syn match gitcommitSummary "^.\{0,80\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell
"  " Quebra automatica de linha
"  au FileType gitcommit
"        \| autocmd CursorMoved,CursorMovedI *
"        \  let &l:textwidth = line('.') == 1 ? 50 : 72
"augroup end

"*********************************************************
" EXTRA CONFIGS
"*********************************************************
if filereadable(expand("~/.nvimrc.extra"))
    source ~/.nvimrc.extra
endif
