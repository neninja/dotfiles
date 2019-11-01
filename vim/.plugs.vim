" Configurações de plugins do vim
" Todos de terceiros estão clonados em start ou opt pelo path:
"   (windows) ~/vimfiles/pack/vendor/
"   (linux) ~/.vim/pack/vendor/
" Plugins próprios em:
"   (windows) ~/vimfiles/pack/nenitf/
"   (linux) ~/.vim/pack/nenitf/

"*********************************************************
" Themes
"*********************************************************
" Ver highlight-groups
"so $VIMRUNTIME/syntax/hitest.vim
""let g:onedark_terminal_italics = 1
" onedark adaptado

" Ver highlight group da palavra sob o cursor
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" :highlight mostra as cores do grupo
command Syntax echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
so ~/dev/dotfiles/vim/thenfeite.vim

" set termguicolors

"-------------------------------------------------
" Dev and Apresentation mode
"-------------------------------------------------
""fun DevRead()
""    Goyo!
""    set background=dark
""endfun
""command Dev call DevRead()
""
""fun AprRead()
""    Goyo
""    set background=light
""endfun
""command Apr call AprRead()

"*********************************************************
" Polyglot
"*********************************************************
let g:polyglot_disabled = ['go', 'latex']

"*********************************************************
" Tagbar
"*********************************************************
""map <leader><bs> :Tagbar<cr>

"*********************************************************
" Fugitive
"*********************************************************
""" Para tirar arquivos de staged basta acessar status com :Gstatus
"""   na janela de status apertar - no arquivo para add ou remover
"""   OBS: Não funciona no windows
""" :gw git add %
""cnoreabbrev gw Gw
""
""" Unstage
""command GrestoreStaged call GitUnstageAFile()
""fun GitUnstageAFile()
""    call LimpaTerminal()
""    G restore --staged %
""    echo "Arquivo agora está unstaged"
""endfun
""" :gc git commit
""cnoreabbrev gc Gcommit
""
""" Executa git status para o primeiro dir .git
""" status do vim-fugitive não funciona no windows
""nmap <leader>gs :call GitStatusManual()<CR>
""fun GitStatusManual()
""    call LimpaTerminal()
""    G status
""endfun
""
""" Abre em vertical split o mesmo arquivo com as diferença de quando esteve staged ou comitado
""nmap <leader>gd :Gvdiff<CR>

"*********************************************************
" Git Messenger
"*********************************************************
""nmap <leader>gm :GitGutterPrevHunk<CR>

"*********************************************************
" Gitgutter
"*********************************************************
""" <leader>hp -> mostra valor anterior do hunk
""" <leader>hs -> stage["git add line"] modificação, removendo chunk
""" <leader>hu -> desfaz modificação não staged no chunk
""nmap [h <Plug>GitGutterPrevHunk
""nmap ]h <Plug>GitGutterNextHunk
""
""" atualização mais rápida
""set updatetime=100
""
""":GitGutterEnable
""let g:gitgutter_enabled=0
""cnoreabbrev ggt call Gitguttettog()
""
""fun Gitguttettog()
""    GitGutterToggle
""    echo "Use [h ]h e <leader>hp <leader>hs <leader>hu"
""endfun

"*********************************************************
" ALE
"*********************************************************
""nmap <silent> ! <Plug>(ale_next_wrap)
""
""function! LinterStatus() abort
""    let l:counts = ale#statusline#Count(bufnr(''))
""    let l:all_errors = l:counts.error + l:counts.style_error
""    let l:all_non_errors = l:counts.total - l:all_errors
""    return l:counts.total == 0 ? 'OK' : printf(
""                \   '%dW %dE',
""                \   all_non_errors,
""                \   all_errors
""                \)
""endfunction
""let g:ale_echo_msg_error_str = 'E'
""let g:ale_echo_msg_warning_str = 'W'
""let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"-------------------------------------------------
" Misc
"-------------------------------------------------
"*********************************************************
" Statusline // using some plugins
"*********************************************************
" Créditos: https://gabri.me/blog/diy-vim-statusline
" Créditos: https://kadekillary.work/post/statusline/

" Plugin modusline
" PROS:
"   mode() muda a cor da statusline
"   cor escolhida através de highlights groups
"   statusline aparece somente nas janelas ativas em split
" CONS:
"   Performance?

" Override statusline's colors default
highlight StatusLine term=standout ctermfg=0 ctermbg=8 guifg=bg guibg=Grey50
highlight WildMenu term=bold,reverse cterm=bold ctermfg=0 ctermbg=75 gui=bold guifg=bg guibg=#61afef

" Customs highlights
highlight CustomStatusLineNormalMode term=standout ctermfg=188 guifg=#dcdfe4
highlight CustomStatusLineInsertMode term=bold,reverse cterm=bold ctermfg=0 ctermbg=10 gui=bold guifg=bg guibg=LightGreen
highlight CustomStatusLineVisualMode term=standout ctermfg=0 ctermbg=176 guifg=bg guibg=#c678dd

let g:modusline_colors           = {}                               " see :help mode()
let g:modusline_colors['n']      = '%#CustomStatusLineNormalMode#'  " Normal
let g:modusline_colors['c']      = ''                               " Command-line
let g:modusline_colors['no']     = '%#DiffChange#'                  " Operator-pending
let g:modusline_colors['v']      = '%#CustomStatusLineVisualMode#'  " Visual by character
let g:modusline_colors['V']      = '%#CustomStatusLineVisualMode#'  " Visual by line
let g:modusline_colors["\<C-V>"] = '%#CustomStatusLineVisualMode#'  " Visual blockwise
let g:modusline_colors['s']      = '%#WildMenu#'                    " Select by character
let g:modusline_colors['S']      = '%#WildMenu#'                    " Select by line
let g:modusline_colors["\<C-S>"] = '%#WildMenu#'                    " Select blockwise
let g:modusline_colors['i']      = '%#CustomStatusLineInsertMode#'  " Insert
let g:modusline_colors['ic']     = '%#CustomStatusLineInsertMode#'  " see :help ins-completion
let g:modusline_colors['R']      = '%#DiffDelete#'                  " Replace |R|
let g:modusline_colors['Rv']     = '%#DiffDelete#'                  " Virtual Replace |gR|
let g:modusline_colors['cv']     = '%#MatchParen#'                  " Vim Ex mode |gQ|
let g:modusline_colors['ce']     = '%#MatchParen#'                  " Normal Ex mode |Q|
let g:modusline_colors['r']      = '%#Todo#'                        " Hit-enter prompt
let g:modusline_colors['rm']     = '%#Todo#'                        " The -- more -- prompt
let g:modusline_colors['r?']     = '%#Todo#'                        " A |:confirm| query of some sort
let g:modusline_colors['!']      = '%#IncSearch#'                   " Shell or external command is executing
let g:modusline_colors['t']      = '%#DiffAdd#'                     " Terminal mode: keys go to the job
let g:modusline_colors['Rc']     = '%#DiffChange#'                  " see :help ins-completion

set statusline=
""set statusline+=\ %{FugitiveStatusline()}	    " Branch
set statusline+=\ %r\%m\%f\ 	                " Nome readonly, modificado e nome abreviado
set statusline+=\%=						        " Espaço
set statusline+=\ %p%%\ %l:\%c                  " Rownumber, total e percentual
""set statusline+=\ %{LinterStatus()}

"*********************************************************
" CtrlP
"*********************************************************
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

nnoremap <Tab> :CtrlPBuffer<CR>
nnoremap <c-t> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|dist\|vendor\|tags'
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

"*********************************************************
" PHPToolBox
"*********************************************************
" disable the default mapping
let g:vim_php_refactoring_use_default_mapping = 0

"*********************************************************
" SnipMate
"*********************************************************
" Unfold:
"   ggVGzo
" Fold:
"   ggVGzc
" Faz com que os snippets possam ser encontrados em ~/dev/dotfiles/snippets
set rtp+=~/dev/dotfiles/vim

"-------------------------------------------------
" Escopos
"-------------------------------------------------
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['html'] = 'html'
let g:snipMate.scope_aliases['php'] = 'php,html'

"*********************************************************
" Startify
"*********************************************************
let g:startify_lists = [
          \ {'type': 'bookmarks', 'header': ['Bookmarks'] },
          \ ]

let g:startify_bookmarks = [
		  \ {'a': '~/dev/dotfiles'},
		  \ {'b': '~/dev/cypressa'},
		  \ ]
