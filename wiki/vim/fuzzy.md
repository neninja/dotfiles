# Fuzzy finder
## Sem plugins
- buffers
```vim
:ls
:bn
:bp
:b <numero do buffer>
:b #
:b <c-d>
:e */**/vim|<tab>
```

### Maps
```vim
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
" Créditos: https://www.vi-improved.org/recommendations/
```

## Com plugins
- [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
