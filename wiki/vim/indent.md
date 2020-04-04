# Indentação

## vimrc
```vim
" permite usar <bs> mesmo indo contra auto-intent, eol e inicio da linha
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

" carrega ftplugin.vim e indent.vim do runtimepath (plugins)
filetype plugin indent on

" auto indentação
set autoindent
```

## Comandos
```vim
=
gg=G
```
