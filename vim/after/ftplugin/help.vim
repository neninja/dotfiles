augroup filetype_help
    au!
    au BufRead <buffer> call <SID>SalvaWtfHelp()
augroup END

function! s:SalvaWtfHelp()
    if(expand('%:t:r') == 'wtf')
        set ma
        set noro
    endif
endfunction
