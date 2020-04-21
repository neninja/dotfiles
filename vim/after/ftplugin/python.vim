"nnoremap <buffer> <leader>r :vsp<CR>:terminal python3 %<CR>

" Colocar no windows
" set pythonthreehome=~/AppData/Local/Programs/Python/Python38-32
" set pythonthreedll=~/AppData/Local/Programs/Python/Python38-32/python38.dll

" Evita erro de DeprecationWarning: the imp module is deprecated in favour of
" importlib; see the module's documentation for alternative uses
" THANKS: https://github.com/powerline/powerline/issues/1925#issuecomment-402635097
if has('python3')
  silent! python3 1
endif

" :make
"THANKS: https://vi.stackexchange.com/a/10147/28875
setl makeprg=python\ %
setl errorformat=%m\ in\ %f\ on\ line\ %l
" THANKS: https://stackoverflow.com/q/17367628/9881278
fun! NN_PythonExecute()
    compiler pyunit
    silent make
    " if ! empty(getqflist())
    if v:shell_error
        copen
    else
        clist
    endif
endfun
