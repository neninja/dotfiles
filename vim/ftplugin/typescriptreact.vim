call AddDict("typescript")
call AddDict("javascriptreact")

" add todas configurações typescript, incluindo dicionarios adicionados
" snippets, snippets importados e etc
execute "source ".g:dotfiles_dir."/vim/after/ftplugin/typescript.vim"
