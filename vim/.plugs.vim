" Configurações de plugins do nvim

" Required:
"call plug#begin(expand('~/.config/nvim/plugged'))
" call plug#begin('~/vimfiles/bundle')

"*********************************************************
" Plug install packages
"*********************************************************
" Barra lateral que mostra variáveis, funçoes objetos e etc
" Instalar ctags: sudo apt-get install exuberant-ctags
" Plug 'majutsushi/tagbar'

" Uteis para git
" Plug 'tpope/vim-fugitive'       " Comandos git no vim
" Plug 'junegunn/gv.vim'          " Commits in browser
" Plug 'airblade/vim-gitgutter'   " Marcações + - _ ~ de git

" Lint geral do vim
" Plug 'dense-analysis/ale'

" Plug 'mattn/emmet-vim'

" cores com highlight no vim
" :ColorToggle
" Plug 'chrisbra/Colorizer'

" Engine de snippets
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" tree
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Status line colorida dependendo do modo
" Plug 'sunaku/vim-modusline'

" Apresentações
" :Goyo ou :Goyo 80%x80%
" Plug 'junegunn/goyo.vim'

" Sintaxe de linguagens vim
" Deve ser instalado DEPOIS do vim go
" Plug 'sheerun/vim-polyglot'

" Fuzzy search
" Plug 'ctrlpvim/ctrlp.vim'

" Universalizar vim/neovim com outros editores usando o mesmo arquivo de configuração
"Plug 'editorconfig/editorconfig-vim'
" call plug#end()

"*********************************************************
"" Plugins config
"*********************************************************
"-------------------------------------------------
" Themes
"-------------------------------------------------
" Ver highlight-groups
"so $VIMRUNTIME/syntax/hitest.vim
""let g:onedark_terminal_italics = 1
" onedark adaptado

" Ver highlight group da palavra sob o cursor
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nnoremap <c-t> <ESC>:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
so ~/dev/dotfiles/vim/thenfeite.vim

" set termguicolors

"-------------------------------------------------
" Dev and Apresentation mode
"-------------------------------------------------
fun DevRead()
    Goyo!
    set background=dark
endfun
command Dev call DevRead()

fun AprRead()
    Goyo
    set background=light
endfun
command Apr call AprRead()

"#########################################
" Polyglot
"#########################################
let g:polyglot_disabled = ['go', 'latex']

"#########################################
" TagBar
"#########################################
map <leader><bs> :Tagbar<cr>

"-------------------------------------------------
" Git
"-------------------------------------------------
"#########################################
" Fugitive
"#########################################
" Para tirar arquivos de staged basta aprter :G
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

"#########################################
" Gitgutter
"#########################################
" <leader>hp -> mostra valor anterior do hunk
" <leader>hs -> stage["git add line"] modificação, removendo chunk
" <leader>hu -> desfaz modificação não staged no chunk
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" atualização mais rápida
set updatetime=100

":GitGutterEnable
let g:gitgutter_enabled=0
cnoreabbrev ggt call Gitguttettog()

fun Gitguttettog()
    GitGutterToggle
    echo "Use [h ]h e <leader>hp <leader>hs <leader>hu"
endfun

"#########################################
" ALE
"#########################################
nmap <silent> ! <Plug>(ale_next_wrap)

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

"-------------------------------------------------
" Misc
"-------------------------------------------------
"#########################################
" Statusline // using some plugins
"#########################################
" Créditos: https://gabri.me/blog/diy-vim-statusline
" Créditos: https://kadekillary.work/post/statusline/

" Plugin modusline
" PROS:
"   mode() muda a cor da statusline
"   statusline aparece somente nas janelas ativas em split
" CONS:
"   Performance?

let g:modusline_colors           = {}              " see :help mode()
let g:modusline_colors['n']      = ''              " Normal
let g:modusline_colors['c']      = ''              " Command-line
let g:modusline_colors['no']     = '%#DiffChange#' " Operator-pending
let g:modusline_colors['v']      = '%#DiffText#'   " Visual by character
let g:modusline_colors['V']      = '%#DiffText#'   " Visual by line
let g:modusline_colors["\<C-V>"] = '%#DiffText#'   " Visual blockwise
let g:modusline_colors['s']      = '%#WildMenu#'   " Select by character
let g:modusline_colors['S']      = '%#WildMenu#'   " Select by line
let g:modusline_colors["\<C-S>"] = '%#WildMenu#'   " Select blockwise
let g:modusline_colors['i']      = '%#DiffAdd#'    " Insert
let g:modusline_colors['R']      = '%#DiffDelete#' " Replace |R|
let g:modusline_colors['Rv']     = '%#DiffDelete#' " Virtual Replace |gR|
let g:modusline_colors['cv']     = '%#MatchParen#' " Vim Ex mode |gQ|
let g:modusline_colors['ce']     = '%#MatchParen#' " Normal Ex mode |Q|
let g:modusline_colors['r']      = '%#Todo#'       " Hit-enter prompt
let g:modusline_colors['rm']     = '%#Todo#'       " The -- more -- prompt
let g:modusline_colors['r?']     = '%#Todo#'       " A |:confirm| query of some sort
let g:modusline_colors['!']      = '%#IncSearch#'  " Shell or external command is executing
let g:modusline_colors['t']      = '%#DiffAdd#'    " Terminal mode: keys go to the job
let g:modusline_colors['ic']     = '%#DiffChange#' " see :help ins-completion
let g:modusline_colors['Rc']     = '%#DiffChange#' " see :help ins-completion

set statusline=
set statusline+=\ %{FugitiveStatusline()}	    " Branch
set statusline+=\ %r\%m\%f\ 	                " Nome readonly, modificado e nome abreviado
set statusline+=\%=						        " Espaço
set statusline+=\ %p%%\ %l:\%c                  " Rownumber, total e percentual
set statusline+=\ %{LinterStatus()}

"#########################################
" CtrlP
"#########################################
" USOS:
"   Escolher arquivo 			<c-p> pesquisar/escolher arquivo <enter>
"   Criar arquivos e o path: 	<c-p> digitar arquivo ou /path/arquivo a ser criado <c-y><enter>
"   Escolher arquivo em split:	<c-p> pesquisar/escolher arquivo <c-h>
"   Escolher arquivo em vsplit:	<c-p> pesquisar/escolher arquivo <c-v>
"
" DICAS:
"	É possível usar tab para completar nomes de pastas
"
" PROS:
"   Escrito em vimscript
"   É possível criar arquivos diretamente

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|dist\|vendor'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_show_hidden = 1

" Permite ctrlp nerdtree sem dar split
"let g:ctrlp_dont_split = 'nerdtree'

" Exibe mesmo os buffers abertos!
let g:ctrlp_match_current_file = 1

" devicons
let g:webdevicons_enable_ctrlp = 1
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


"#########################################
" snipmate
"#########################################
" Unfold:
"   ggVGzo
" Fold:
"   ggVGzc

"#########################################
" Startify
"#########################################
let g:startify_lists = [
          \ {'type': 'bookmarks', 'header': ['Bookmarks'] },
          \ ]

let g:startify_bookmarks = [
		  \ {'a': '~/dev/dotfiles'},
		  \ {'b': '~/dev/cypressa'},
		  \ {'c': 'C:\HashiCorp\Phalcon4-PHP7-Ubuntu\erp'},
		  \ ]

"#########################################
" NERDTree
"#########################################
"nmap <silent> <BS> :NERDTreeToggle<CR>
"let NERDTreeShowLineNumbers=1
"let NERDTreeShowHidden=1