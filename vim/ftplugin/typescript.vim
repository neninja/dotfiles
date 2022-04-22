setl tabstop=2
setl softtabstop=2
setl shiftwidth=2
call AddDict("javascript")
execute "source ".g:dotfiles_dir."/vim/ftplugin/javascript_snippets.vim"

inorea <buffer> routese <esc>:call TestaTriggerSnippet('fun', 'SnippetTsExpressRoute')<cr>
