"# wtf-file-packages
"## mhinz/vim-grepper
nnoremap <c-f> :Grepper -tool git -side<cr>
nnoremap <leader>ga :Grepper -tool ag<cr>
nnoremap <leader>gs :Grepper -tool ag -side<cr>

"## ctrlpvim/ctrlp.vim
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>

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

" somente wildignore não funciona no linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.svn$\|node_modules\|dist\|target$\|build\|vendor$\|ios$\|android\|site\|coverage$\|_reports\|DS_Store\|\.next\|_cache',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$\|\.venv\|tags$'
  \ }

" não limita arquivos
let g:ctrlp_max_files=0

"## unblevable/quick-scope
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"## mhinz/vim-startify
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
            \ ['。　　•　 　ﾟ　　。', '　.　　　　.　　ඞ　。　　 。', '.　　 。　　　　  。 . 　　 •    •', 'nenitf was not the impostor'],
            \ ]
let g:startify_lists = [
            \ { 'type': 'sessions', 'header': ['sessões'] },
            \ { 'type': 'commands', 'header': ['comandos'] },
            \ ]
let g:startify_files_number = 5
let g:startify_commands = [
            \ {'d': ['dotfiles', ':call GoToDotfiles()']},
            \ {'g': ['go projects', ':e ~/go/src/github.com/nenitf']},
            \ {'p': ['php projects', ':e ~/dev/php']},
            \ ]

packadd! vim-startify

function! GoToDotfiles()
    exec "cd ".g:dotfiles_dir
    e vim/vimrc
endfunction

"## plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_new_list_item_indent = 0

"## tpope/vim-fugitive
command! GC :Gw | Gcommit

nmap <leader>gg :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

"## junegunn/goyo.vim
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

"## pangloss/vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "←"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "→"

"## MaxMEllon/vim-jsx-pretty

"## diepm/vim-rest-console
" TODO ver como utilizar $VARIAVEIS no Windows

" Para formatar o json precisa do python instalado
let g:vrc_response_default_content_type = 'application/json'
"let g:vrc_debug = 1
"let g:vrc_show_command = 1

let g:vrc_curl_opts = {
            \ '-s': ''
            \}

let g:vrc_trigger = '<C-x>'
