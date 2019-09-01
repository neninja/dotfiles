" Créditos: https://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
fun! Dos2unix()
    " Don't strip on these filetypes
    " :echo &ft
    if &ft =~ 'startify\|nerdtree'
        return
    endif
    :e ++ff=dos
endfun

autocmd BufRead * call Dos2unix()