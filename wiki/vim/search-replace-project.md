# Search e replace no projeto
## Sem plugins
### Opção 1
``:call GitGrep()``
```vim
" Créditos: https://michaelheap.com/set-parent-git-directory-to-current-path-in-vim/
function! NN_SetGitDir()
    " Change working dir to the current file
    cd %:p:h
    " Set 'gitdir' to be the folder containing .git
    let gitdir=system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    " If it empty, there was no error. Let's cd
    if empty(isnotgitdir)
        cd `=gitdir`
    endif
endfunction

" Search/grep
" Créditos: https://www.commandlinefu.com/commands/view/12833/get-a-list-of-all-todofixme-tasks-left-to-be-done-in-your-project
fun! GitGrep()
    " Muda workdir
    call NN_SetGitDir()
    let grepword = input("Grep: ")
    exec "silent !git grep -EIn \"" . grepword . "\""
endfun
```

### Opção 2
``:call Grep()``
```vim
" Remove das sugestões arquivos/diretorios (lvimgrep tb)
set wildignore=node_modules/*
set wildignore+=dist/*
set wildignore+=vim/dicionarios/*,
set wildignore+=vendor/*
set wildignore+=_site/*

" Créditos: https://michaelheap.com/set-parent-git-directory-to-current-path-in-vim/
function! NN_SetGitDir()
    " Change working dir to the current file
    cd %:p:h
    " Set 'gitdir' to be the folder containing .git
    let gitdir=system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    " If it empty, there was no error. Let's cd
    if empty(isnotgitdir)
        cd `=gitdir`
    endif
endfunction

fun! Grep()
    " Muda workdir
    call NN_SetGitDir()
    let s:grepword = input("Grep: ")        
    exec "lvimgrep /" . s:grepword . "/j **"
    lopen
endfun
```
<!-- TODO qual a difderença com :vimgrep /pattern/ ** -->

<!-- https://stackoverflow.com/questions/20933836/what-is-the-difference-between-location-list-and-quickfix-list-in-vim

The location list is local to the current window so you can have as many location lists as windows: 30 windows? No problem, here are your 30 concurrent location lists.

The quickfix list is global so you can't have more than one available at a time. There are commands that allow you to replace the current quickfix list with a previous one but you can't have two concurrent quickfix lists.

Don't confuse the location/quickfix "lists" (the data structures) with the location/quickfix "windows" (the windows displaying the content of those data structures). The "windows" have similar behaviors but the "lists" don't. The difference is important because those windows are thankfully not the only ways to interact with those lists: there are many commands that allow us to move through those lists without opening the associated windows and knowing the difference between those lists is key to using those commands efficiently.

Hands-on illustrated example:

$ vim -O foo.txt bar.txt

    Do :lvim foo % in foo.txt to create a location list for the window containing foo.txt.

    Do :lne a few times to jump to a few foo in foo.txt.

    Focus on bar.txt and do :lne. What happens?

    Now, do :lvim bar % in bar.txt to create a location list for the window containing bar.txt.

    Do :lne a few times. What matches do you jump to? In which buffer? In which window?

    Switch to the other window and do :lne a few times. What happens?

    Switch again to bar.txt. What does :lne do?

    Now, do :vim bar % in bar.txt to create a quickfix list.

    Do :cn a few times to jump to a few bar in bar.txt.

    Now, focus on foo.txt, what does :cn do?

The location you jump to with :lne depends on the window you are in but the error you jump to with :cn is always the same (until you replace the current quickfix list with another one).

Both lists have relatively clear roles IMO: the quickfix list (and thus the quickfix window) is usually and quite logically devoted to errors and the location list seems (to me) fit for search.

    
    More generally: The quickfix list is best when your search or compile involves multiple files, the location list best when only a single file is involved. – Trebor Rude Aug 29 '14 at 17:40

    In particular, if you launch vim with -q errors.txt, after putting compile errors in errors.txt (i.e. gcc -Wall *.c >errors.txt 2>&1), vim will populate the quickfix list from the list of compile errors, which is very handy. – Kevin Dec 11 '14 at 14:47

-->

## Com plugins
[fugitive](https://github.com/tpope/vim-fugitive)
```vim
:Ggrep <word> | cw
```
