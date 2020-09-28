setl tabstop=2
setl softtabstop=2
setl shiftwidth=2
call AddDict("javascript")
execute "source ".g:dotfiles_dir."/vim/after/ftplugin/javascript_snippets.vim"

inorea <buffer> routese <esc>:call TestaTriggerSnippet('fun', 'SnippetTsExpressRoute')<cr>

fun! SnippetTsExpressRoute()
    normal! iroutes.get('/'
    normal! ms
    normal! a, (request, response) => {
    normal! o})
    normal! Oreturn response.json(<++>)
    normal! `s
    startinsert
endfun

" nnoremap <buffer> <c-w>] :TsuquyomiDefinition<cr>
" nnoremap <buffer> <c-w>[ :TsuquyomiGoBack<cr>
" <c-]>
nnoremap <buffer> <c-\> :TsuquyomiDefinition<cr>
nnoremap <buffer> <c-[> :TsuquyomiGoBack<cr>
