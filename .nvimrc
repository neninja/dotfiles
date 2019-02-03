" autor: felipedacs
" A partir de vim-bootstrap b0a75e4
" motivacional: https://www.youtube.com/watch?v=XA2WjJbmmoM

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

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*********************************************************
" Plug install packages
"*********************************************************
" Barra lateral que mostra variáveis, funçoes objetos e etc
" Instalar ctags: sudo apt-get install exuberant-ctags
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-fugitive'                   " Comandos git no vim
Plug 'junegunn/gv.vim'                      " Commits in browser
Plug 'gregsexton/gitv', {'on': ['Gitv']}    " Arvore de branches
Plug 'airblade/vim-gitgutter'               " Marcações + - _ ~ de git
Plug 'SirVer/ultisnips'                     " Engine de snippets
Plug 'w0rp/ale'                             " Lint geral do vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " ctrl p
Plug 'junegunn/fzf.vim'                                             " ctrl p

Plug 'junegunn/goyo.vim'    " Modo limpo
Plug 'chrisbra/Colorizer'   " Cores mostradas com código

" Favorite themes
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ewilazarus/preto'
Plug 'andreasvc/vim-256noir'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Sintaxe de linguagens vim
" Deve ser instalado DEPOIS do vim go
Plug 'sheerun/vim-polyglot'
call plug#end()

"*********************************************************
" Basic Setup
"*********************************************************
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

let mapleader=' '

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile
set autochdir
set fileformats=unix,dos,mac

" Delay entre atalhos
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" Copy paste
set clipboard=unnamed
vnoremap <leader>y "+y:echo "Copiado!!"<CR>

" Quebra de linha com simbolo
set showbreak=↳\

" Mostra os comandos no canto inferior direito
set showcmd

"*********************************************************
" Visual Settings
"*********************************************************
syntax on
filetype plugin indent on
set relativenumber          " distancias entre a linha do cursor
set number                  " numero das linhas
set autoread                " vim checar quando o texto for modificado
set showmatch               "mostra fechamento de {['']}
set ai                      "auto indentação -> ==
set mouse=a                 "libera uso do mouse em todos modos

" Search mappings: These will make it so that going to the next one in a
" Search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"#########################################
" Themes
"#########################################
"---------------------------------------
" OneDark
"---------------------------------------
let g:onedark_terminal_italics=1

"---------------------------------------
" PaperColor
"---------------------------------------
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': { 
  \ 		'allow_bold': 1,
  \ 		'allow_italic': 1
  \     }
  \   }
  \ }

"---------------------------------------
set background=dark " light or dark for PaperColor colorscheme
colorscheme PaperColor

" Cores mais bonitas porem não funciona com urxvt ¯\_(ツ)_/¯
" set termguicolors

"*********************************************************
" Abbreviations
"*********************************************************
" Completar snippet
noremap ,, <Esc>/{%[^%]*%}<CR>zzc%
inoremap ,, <Esc>/{%[^%]*%}<CR>zzc%

" Fechar automaticamente
" Melhorar o <left><left>......, vimrc não reconhece comando de leader para {%%}
" Muito cansativo usar a regra de quebrar linha no {} e rever em outros para não fazer
inoremap ¢ (){%%}<left><left><left><left><left>
inoremap ( (){%%}<left><left><left><left><left>
inoremap { {}{%%}<left><left><left><left><left>
inoremap [ []{%%}<left><left><left><left><left>
inoremap " ""{%%}<left><left><left><left><left>
inoremap ' ''{%%}<left><left><left><left><left>

inoremap *** <c-K>Sb<space>
inoremap --- <CR><CR><up><tab><tab><tab><tab><tab><tab><c-K>HH<c-K>HH<c-K>HH<down>

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

"######################################################
" Help
"######################################################
command Rc execute ":vsp ~/.nvimrc"
cnoreabbrev rc Rc

cnoreabbrev cul set cul
cnoreabbrev nocul set nocul

noremap <silent> <leader>n :vsp ~/dev/dacsfiles/.vim/vim-notes/<CR>

"*********************************************************
" Mappings
"*********************************************************
" j e k mantem cursor no meio do editor
nnoremap j jzz
nnoremap k kzz

" Only hjkl
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

set wildmenu
set wildmode=list:full
set completeopt=longest,menuone,preview " cool completion view
set completeopt+=noselect               " deixar digitar
set wildchar=<Tab>                      " (default)
set omnifunc=syntaxcomplete#Complete    " ctrl-x ctrl-o
set complete=.,w,b,u,t

nnoremap <c-n> :tabe 

" Acabar com o ctrl z
nnoremap <C-Z> u
nnoremap <c-z> u

" Split
" Open the same file
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
" Search an file
noremap <Leader>l :<C-u>vsp
noremap <Leader>j :<C-u>sp

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Clean search (highlight)
nnoremap <leader><space> :noh<cr>

" Indent all file and go back
nnoremap <C-A> i<++><esc>gg=G:%s/<++>/<esc>

" Echo local
noremap <Leader>. :pwd<CR>

"*********************************************************
" Custom configs langs
"*********************************************************
" Funções para comentar linhas de código
" Parametro deve ser entre aspas e conter, se necessário, espaço e contra-barra
function ComentaNormal(carac)
    execute "normal! I".a:carac
    echo a:carac
endfunction

function ComentaVisual(carac)
    execute "normal! I".a:carac
endfunction

"#########################################
" MARKDOWN
"#########################################
augroup markdown
    " Compila, abre evince e deleta pdf
    au FileType markdown nmap <leader>r <Esc>:w<CR>:!clear;pandoc % -o '%:r'.pdf<CR><CR>
    au FileType markdown nmap <leader>e <Esc>:w<CR>:!clear;evince '%:r'.pdf &<CR><CR>
    au FileType markdown nmap <leader>d <Esc>:w<CR>:!clear;rm '%:r'.pdf &<CR><CR>
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

    " Compila duas vezes para pdf
    " É necessário compilar duas vezes para ter certeza de atualizar a toc
    " https://tex.stackexchange.com/questions/301103/empty-table-of-contents
    au FileType tex nmap <leader>r <Esc>:w<CR>:!clear;pdflatex %<CR><CR>:!clear;pdflatex %<CR><CR>:!clear;bibtex '%:r'.aux<CR><CR>:!clear;pdflatex %<CR><CR>:!clear;pdflatex %<CR><CR>

    " Abre evince
    au FileType tex nmap <leader>e <Esc>:w<CR>:!clear;evince '%:r'.pdf &<CR><CR>
augroup END

" Reconhecer classes com syntax de latex
au BufNewFile,BufRead *.cls set filetype=tex

"#########################################
" GO
"#########################################
augroup go
    " Comenta
    au FileType go vnoremap // :call ComentaVisual("// ")<CR>
    au FileType go vnoremap ;; :s/\/\/\s/<CR>:noh<CR>
    au FileType go nmap // :call ComentaNormal("// ")<esc>
    au FileType go nmap ;; :s/\/\/\s/<CR>:noh<CR>

    " Executa
    au FileType go nmap <leader>r <Plug>(go-run)

    " Testa
    au FileType go nmap <leader>tp <Plug>(go-test)
    au FileType go nmap <leader>tt :GoTest ./...<CR>
    au FileType go nmap <leader>tf <Plug>(go-test-func)
    au FileType go nmap <leader>cc <Plug>(go-coverage-toggle)
    au FileType go nmap <leader>cb :GoCoverageBrowser<CR>
    au FileType go nmap <leader>a :w<CR>:GoAlternate<CR>
    ":AV
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    ":AI
    au Filetype go command! -bang AI call go#alternate#Switch(<bang>0, 'split')

   " Documentação
    au FileType go nmap <leader>dv <Plug>(go-doc)
    au FileType go nmap <leader>db <Plug>(go-doc-browser)
    au FileType go nmap <leader>gi <Plug>(go-info)

    "<- [[
    "-> ]]
    au FileType go nmap <leader>dc :GoDecls<CR>
    au FileType go nmap <leader>dd :GoDeclsDir<CR>
augroup END

"#########################################
" HTML
"#########################################

"#########################################
" CSS
"#########################################

"#########################################
" JAVASCRIPT
"#########################################

"#########################################
" PYTHON
"#########################################
" Execução
""nnoremap <leader>py <Esc>:w<CR>:!clear;python3 %<CR>

"#########################################
" PHP
"#########################################

"*********************************************************
"" Plugins config
"*********************************************************

"#########################################
" Polyglot
"#########################################
if exists('g:loaded_polyglot')
    let g:polyglot_disabled = ['go']
endif

"#########################################
" fzf
"#########################################
nnoremap <c-p> :Files<CR>

"#########################################
" Vim-Go
"#########################################
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports" " import automatico ao salvar
let g:go_fmt_fail_silently = 1
let g:go_info_mode='guru'

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"#########################################
" Deoplete
"#########################################
let g:deoplete#enable_at_startup = 1

"#########################################
" UltiSnips
"#########################################
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'~/dev/dacs-snippets']
let g:UltiSnipsSnippetsDir="~/dev/dacs-snippets"
let g:tex_flavor='latex' "ultisnippets reconhecerem .tex

noremap <leader><tab> :UltiSnipsEdit<cr>/\<snippet\> .*<cr>N:echo "tecle n"<cr>

"#########################################
" TagBar
"#########################################
map <leader><bs> :Tagbar<cr>

"#########################################
" Fugitive
"#########################################
noremap <Leader>gw :Gw<CR>
noremap <Leader>gq :Gwq<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gr :Gread<CR>

"#########################################
" Gitgutter
"#########################################
" [c -> previous chunk   ]c -> next chunk
" <leader>hp -> mostra valor anterior do hunk
" <leader>hs -> stage["git add line"] modificação, removendo chunk
" <leader>hu -> desfaz modificação não staged no chunk
set updatetime=100 "atualização mais rápida

":GitGutterEnable
let g:gitgutter_enabled=0
noremap <leader>c :GitGutterToggle<CR>

"#########################################
" Ale
"#########################################
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:counts.total == 0 ? '' : '!'
endfunction

nmap <silent> ! <Plug>(ale_previous_wrap)

"*********************************************************
" Vim Built-in plugins config
"*********************************************************
"#########################################
" File browsing
"#########################################
" :edit a folder to open a file browser
" <CR>/v/t to open in an h-split/v-split/tab
" check |netrw-browse-maps| for more mappings
let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" Toggle para mostrar diretórios
let g:tnet = 1
fun! ToggleGerenciador()
    if(g:tnet==1)
        :vs
        :edit .
        let g:tnet = 0
    else
        :q!
        let g:tnet = 1
    endif
endfun
nnoremap <leader><CR> :call ToggleGerenciador()<cr>

"######################################################
" Statusline
"######################################################
" Créditos: https://gabri.me/blog/diy-vim-statusline
" Créditos: https://kadekillary.work/post/statusline/
set laststatus=2	"fixar status bar

" Find out current buffer's size and output it.
fun! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfun

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

set statusline+=
set statusline+=\%{LinterStatus()}
set statusline+=%=						        " Espaço
set statusline+=\ %{FugitiveStatusline()}\ %*	" branch
set statusline+=\ %m\%f\ %* 	                " nome abreviado/teste readonly/modificado/
set statusline+=%=						        " Espaço
set statusline+=\ %{FileSize()}			        " Tamanho arquivo
set statusline+=\ %p%%\ %l:\%c                  " Rownumber/total (%)

