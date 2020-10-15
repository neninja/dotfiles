"# wtf-file-dotfiles
colorscheme vyin

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
augroup filetype_detect
    au BufEnter,BufNewFile TODO,DONE setfiletype todolist
augroup END

let g:todolist_dir = "~/TODOLIST"
command! TodoList call TodoQuick('\(\C\<TODO\>\|\C\<WAIT\>\)') | cli | call feedkeys(":cw | :silent cc ")
command! TodoSimpleGrep execute "silent noa vimgrep /\\C\\<TODO\\>/j ".g:todolist_dir."/TODO" | cw

function! TodoQuick(regex)
    cclose

    let todo = []
    let current_title = ''

    let todofile = g:todolist_dir . "/TODO"
    execute "silent vimgrep /".a:regex."/j ".todofile

    let qf = getqflist()
    let file = readfile(glob(todofile))
    for line in qf
        let lnum = line.lnum
        for pastline_nr in reverse(range(0, lnum))
            if(match(file[pastline_nr], '\S') == 0)
                let line.module = file[pastline_nr]
                break
            endif
        endfor
    endfor

    call setqflist(qf)
endfunction
