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
    au BufEnter,BufNewFile BACKLOG,DONE setfiletype todolist
augroup END

let g:todolist_dir = "~/TODOLIST"
let g:todolist_backlog = g:todolist_dir."/BACKLOG"
let g:todolist_done = g:todolist_dir."/DONE"

nnoremap <leader>o :call TodoListMenu()<CR>

command! TodoListVGrep execute "silent noa lvimgrep /\\C\\<TODO\\>/j ".g:todolist_backlog | lli
command! TodoList call TodoListSearchStatus({'TODO':'\C\<TODO\>','WAIT':'\C\<WAIT\>'})
command! TodoListFileBacklog call <SID>OpenBacklogFile()
command! TodoListFileDone execute "e ".g:todolist_done

function! s:OpenBacklogFile()
    execute "e ".g:todolist_backlog
    try
        silent lvimgrep /\C\<TODO\>/j %
    catch
        redraw
		echohl WarningMsg | echo "Sem TODO" | echohl None
    endtry
endfunction

function! TodoListSearchStatus(regex)
    let todo = []
    let current_title = ''

    try
        execute "silent lvimgrep /\\(".join(values(a:regex), '\|')."\\)/j ".g:todolist_backlog
    catch
        redraw
        echohl WarningMsg | echo "Sem ".join(keys(a:regex), ", ") | echohl None
        return
    endtry

    let qf = getloclist(0)
    let file = readfile(glob(g:todolist_backlog))
    for line in qf
        let lnum = line.lnum
        let line.alnum = line.lnum
        let line.lnum = ''
        let line.acol = line.col
        let line.col = ''

        for key in keys(a:regex)
            if(match(line.text, a:regex[key]) > 0)
                let line.pattern=key
                let line.text = substitute(line.text, a:regex[key], '', '')
                break
            endif
        endfor

        if(match(line.text, '\S') == 0)
            let line.text = ''
        else
            let line.text = substitute(line.text, '^\s*', '', '')
            let line.text = substitute(line.text, '^- ', '', '')
            let line.text = substitute(line.text, '^= ', '', '')
            let line.text = substitute(line.text, '^+ ', '', '')
        endif
        for indexLine in reverse(range(0, lnum-1))
            if(match(file[indexLine], '\S') == 0)
                let module = substitute(file[indexLine], ' \C\<TODO\>', '', '')
                let module = substitute(module, ' \C\<WAIT\>', '', '')
                let line.module = module
                break
            endif
        endfor
    endfor
    call setloclist(0,qf)
    lli

    for line in qf
        let line.lnum = line.alnum
        let line.col = line.acol
        let line.pattern = ''
    endfor
    call setloclist(0,qf)

    let idx = input("Item: ", "", "customlist,TodoListll")
    if(idx>0)
        execute "silent ll ".idx
        normal zO
    endif
endfunction

function! TodoListll(ArgLead, CmdLine, CursorPos)
    return map(range(1, len(getloclist(0))), 'string(v:val)')
endfunction

function! TodoListCommands(ArgLead, CmdLine, CursorPos)
    let filename = expand('%:t:r')
    if(filename == 'BACKLOG' || filename == 'DONE')
        return ['Todo', 'Wait', 'TodoList', 'TodoListFileBacklog', 'TodoListFileDone']
    endif
    return ['TodoList', 'TodoListFileBacklog', 'TodoListFileDone']
endfunction

function! TodoListMenu()
    let cmd = input("> ", "\<c-d>", "customlist,TodoListCommands")
    if(cmd=='')
        return
    endif
    execute cmd
endfunction
