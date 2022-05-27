" Execução de comandos com output em um buffer temporario. Utilização:
" 1. :Showme echo "exemplo de comando"

" THANKS: https://stackoverflow.com/a/10495799/9881278
function! s:RunCmd(line)
    " pedit duplicado pois precisa abrir a primeira vez a preview window para zerar o conteudo
    silent! noautocmd botright pedit RUNCMD
    silent! noautocmd botright pedit RUNCMD
    noautocmd wincmd P
    set buftype=nofile
    exe "noautocmd r! ".a:line
    noautocmd wincmd p
endfunction

command! -nargs=1 ShowMe :call <SID>RunCmd(<q-args>)

