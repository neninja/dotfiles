"# wtf-file-dotfiles

let g:dotfiles_dir = expand('<sfile>:p:h:h')

function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

call SourceIfExists("~/.vimrc-pre.vim")
call SourceIfExists(g:dotfiles_dir."/vim/vimrc")
call SourceIfExists(g:dotfiles_dir."/vim/mypacks/dia.vim")
call SourceIfExists(g:dotfiles_dir."/vim/mypacks/showme.vim")
call SourceIfExists(g:dotfiles_dir."/vim/mypacks/snipid.vim")
call SourceIfExists(g:dotfiles_dir."/vim/packages.vim")

"## RuntimePaths
"wtf-rtp
execute "set runtimepath+=".g:dotfiles_dir."/vim"
set packpath+=~/vimfiles

colorscheme vyin

set spelllang=pt_br
execute "set spellfile=".g:dotfiles_dir."/vim/spell/pt.utf-8.add"

"## Templates
augroup skeletons
    au!
    au BufNewFile *.html call AddSkeleton("skeleton.html")
    au BufNewFile *.sh call AddSkeleton("skeleton.sh")
    au BufNewFile *.php call AddSkeleton("skeleton.php")
    au BufNewFile *.gv call AddSkeleton("skeleton.gv")
    au BufNewFile *.rest call AddSkeleton("skeleton.rest")
    au BufNewFile *.go call AddGoSkeleton("skeleton.go")
    au BufNewFile .editorconfig call AddSkeleton("skeleton.editorconfig")
    au BufNewFile phpunit.xml call AddSkeleton("phpunit.xml")
augroup END

function! AddGoSkeleton(arquivo)
    let filename = expand('%:t:r')
    if(filename == 'main')
        call AddSkeleton("main.go")
        exec "normal! 3G"
    elseif(filename[-5:] == '_test')
        let foldername = expand('%:p:h:t')
        exec "normal! Opackage ".foldername
        normal! Goimport "testing"
        normal! o
    else
        let foldername = expand('%:p:h:t')
        exec "normal! Apackage ".foldername
    endif
endfunction

function! AddSkeleton(arquivo)
    execute "0r ".g:dotfiles_dir."/vim/skeletons/".a:arquivo
endfunction

"## Dicionários
let g:dict_dir = g:dotfiles_dir. "/vim/dicionarios"
augroup dicionarios
    au!
    au BufEnter * call AddDict(&ft)
    au BufEnter *test.php execute "setlocal dictionary+=".g:dict_dir."/phpunit.dict"
augroup END

function! AddDict(arquivo)
    execute "setl dictionary+=".g:dict_dir."/".a:arquivo.".dict"
endfunction

"## Sources adicionais
"wtf-sources
call SourceIfExists("~/.vimrc-local.vim")

" TODO remover source quando outro .exrc for carregado
call SourceIfExists(".exrc")
au DirChanged * :call SourceIfExists(".exrc")

