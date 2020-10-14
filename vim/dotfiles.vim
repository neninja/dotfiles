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
augroup filetype_detect
    au BufEnter,BufNewFile BACKLOG,TODO,DOING,WAITING,DONE setfiletype todolist
augroup END

let g:todolist_dir = "~/TODOLIST"
command! TodoGrep cclose | silent execute "noa vimgrep /\\C\\<TODO\\>/j ".g:todolist_dir."/TODO" | cw
command! Todo call TodoGrep('\C\<TODO\>')
command! Wait call TodoGrep('\C\<WAIT\>')

function TodoGrep(regex)
    cclose
    try
        silent execute "vimgrep /"a:regex."/ ".g:todolist_dir."/TODO"
    catch
        return
    endtry
    cfirst
    let qf = getqflist()
    for d in qf
        exec d.lnum
        call search('^\S', 'b')
        let modulo = getline('.')
        let d.module = modulo
        " echo bufname(d.bufnr) ':' d.lnum '=' d.text '->' modulo
    endfor
    call setqflist(qf)
    cw
endfunction
