" autor: nenitf
" A partir de vim-bootstrap b0a75e4
" motivacional: https://www.youtube.com/watch?v=XA2WjJbmmoM

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
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

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
" Abbreviations/Commands
"*********************************************************
" No one is really happy until you have this shortcuts
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

" Cursor
cnoreabbrev cul set cul
cnoreabbrev nocul set nocul

"-------------------------------------------------
" Nvimrc
"-------------------------------------------------
cnoreabbrev rc vsp ~/.nvimrc
cnoreabbrev rp vsp ~/.nvimrc.plugs
cnoreabbrev rs source ~/.nvimrc

"*********************************************************
" Mappings
"*********************************************************
" Completar snippet
noremap ,, <ESC>/{#[^%]*#}<CR>c%
inoremap ,, <ESC>/{#[^%]*#}<CR>c%

" Fechar automaticamente
" Melhorar o <left><left>......, vimrc não reconhece comando de leader para {~~}
" Muito cansativo usar a regra de quebrar linha no {} e rever em outros para não fazer
inoremap ¢ (){##}<left><left><left><left><left>
inoremap ( (){##}<left><left><left><left><left>
inoremap { {}{##}<left><left><left><left><left>
inoremap [ []{##}<left><left><left><left><left>
inoremap " ""{##}<left><left><left><left><left>
inoremap ' ''{##}<left><left><left><left><left>

" surround
xnoremap ¢ xi()<ESC>P<ESC>
xnoremap ( xi()<ESC>P<ESC>
xnoremap { xi{}<ESC>P<ESC>
xnoremap [ xi[]<ESC>P<ESC>
xnoremap " xi""<ESC>P<ESC>
xnoremap ' xi''<ESC>P<ESC>

" emoticons unicode
" https://www.jemoticons.com/en/
" angry as a fuck, flip the table
inoremap \\a (╯°□°)╯︵ ┻━┻
" bring back the table
inoremap \\b ┬──┬ ノ(°-°ノ)
" cool
inoremap \\c (⌐■_■)
" dancing
inoremap \\d ヾ(⌐■_■)ノ♪
" forsake
inoremap \\f (´ヘ｀;)
" gopher
inoremap \\g ʕ◔ϖ◔ʔ
" happy
inoremap \\h \(•◡•)/
" impressed
inoremap \\i (ﾉ°▽̣°)ﾉ
" lenny face
inoremap \\l ( ͡° ͜ʖ ͡°)
" mighty
inoremap \\m ᕙ(°□°)ᕗ
" put some magic
inoremap \\p (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
" run
inoremap \\r ε=ε=┏( >_<)┛
" shrug
inoremap \\s ¯\_(ツ)_/¯
" thanks
inoremap \\t (~˘▾˘)~
" i don't understand
inoremap \\u ┐(´д`)┌
" worried
inoremap \\w (⊙﹏⊙)
" yeah
inoremap \\y ╭( ˃̵ᴗ˂̵)و
" whyyyy
inoremap \\? ( ˘･з･)

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
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Resize
noremap - <C-w>-
noremap + <C-w>+
noremap > <C-w>>
noremap < <C-w><

"*********************************************************
" Visual Settings
"*********************************************************
syntax on                   " Required for plugins
filetype plugin indent on   " Required for plugins
set relativenumber          " Distancias entre a linha do cursor
set number                  " Numero das linhas
set autoread                " Checar quando o texto for modificado
set showmatch               " Mostra fechamento de {['']}
set ai                      " Auto indentação -> ==
set mouse=a                 " Libera uso do mouse em todos modos

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
    au FileType csv nmap <leader>r <Esc>:w<CR>:sav! /tmp/%.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-<ESC>:%s/;/\|/<CR>:w<CR>:!pandoc % -o '%:r'.pdf<CR><CR>:bd<CR>
    au FileType csv nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER /tmp/'%:r'.csv.pdf &<CR><CR>
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
"*********************************************************
" Buffers
"*********************************************************
" Use buffers instead tabs
"   the same file dont open twice
"   more velocity
" View and select buffers
nnoremap <Tab> :ls <CR>:b<Space>

" Open new file in buffer
nnoremap <c-n> :e<Space>

nnoremap <silent> <leader>dd :bd<cr>
nnoremap <silent> <leader>df :bd!<cr>

nnoremap <silent> [b :bp<CR>
nnoremap <silent> [<Space> :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> ]<Space> :bn<CR>
nnoremap <silent> [B :bp<CR>
nnoremap <silent> ]B :bn<CR>

" Leave a buffer even without save
set hidden
"*********************************************************
" Netrw
"*********************************************************
" :h netrw-quickcom
" <CR>/v/t to open in an h-split/v-split/tab
" Check |netrw-browse-maps| for more mappings
let g:netrw_banner=0        " Disable annoying banner
let g:netrw_altv=1          " Open splits to the right
let g:netrw_liststyle=3     " Tree view
"set autochdir "Deixa absoluto o path do netrw!!!

" Toggle para mostrar diretórios
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <leader><CR> :call ToggleNetrw()<CR>
