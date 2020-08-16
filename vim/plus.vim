"# wtf-file-plus

set number relativenumber

"## Autocomplete
set complete=.,b,k,w

augroup autocompleteOnInsert
    au!
    autocmd InsertEnter * 
                \ let save_cwd = getcwd() |
                \ execute "set tags=".fnameescape(save_cwd)."/tags" |
                \ set autochdir |
                \ set noignorecase
    autocmd InsertLeave * 
                \ set noautochdir |
                \ execute 'cd' fnameescape(save_cwd) |
                \ set ignorecase

    " TODO existe diferença de perf mudando o evento?
    " autocmd InsertCharPre * call AutoComplete()
    " autocmd CursorMovedI * call AutoComplete()
    autocmd CursorHoldI * call AutoComplete()
augroup END

function! AutoComplete()
    " if !pumvisible()
    " noa call feedkeys("\<C-n>", 'n')
    " endif  

    " Encerra o if sem calculo caso ja exista um popup
    if !pumvisible()
        if getline('.')[col('.') - 3] =~ '\K' && getline('.')[col('.') - 2] =~ '\K' " last two chars
            noa call feedkeys("\<C-n>", 'n')
        endif
    endif
endfunction

inoremap <expr> <CR> pumvisible() ? "\<esc>a\<CR>" : "\<CR>"
