"# wtf-file-dotfiles
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

"## Todolist
" Um colorscheme diferente é necessário para grupos que são modificados
" somente no todolist, como o Folded
let first_colorscheme = g:colors_name
augroup filetype_detect
    au BufEnter,BufNewFile * execute "colorscheme ".first_colorscheme
    au BufEnter,BufNewFile BACKLOG,TODO,DOING,WAITING,DONE setfiletype todolist
    au BufEnter,BufNewFile BACKLOG,TODO,DOING,WAITING,DONE colorscheme todolist
augroup END

let g:todolist_dir = "~/TODOLIST"
command! DOING execute "lgetfile ".g:todolist_dir."/DOING" | llist!
command! TodoList silent exec ":cd ".g:todolist_dir | tabnew BACKLOG | belowright vnew DOING | belowright split WAITING | sb BACKLOG | belowright split TODO | sb DOING
