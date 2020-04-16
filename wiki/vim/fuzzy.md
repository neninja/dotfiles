# Fuzzy finder
## Sem plugins
```vim
" buffers
:ls
:bn
:bp
:b <numero do buffer>
:b #
:b <c-d>

" THANKS: https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb
" baixa perf
:e */**/vim|<tab>

"THANKS: http://ellengummesson.com/blog/2015/08/01/dropping-ctrlp-and-other-vim-plugins/
" ignorar pastas no wildignore
set wildignore+=**/.git/** 
set wildignore+=**/node_modules/** 
set wildignore+=**/android/** 
set wildignore+=**/ios/** 
set wildignore+=**/vendor/** 
set wildignore+=**/_site/** 
set wildignore+=**/vendor/** 
" https://vi.stackexchange.com/questions/11644/ignore-folders-when-performing-find-command
" baixa perf
:set path+=**
:find <arquivo>
```

### Maps
```vim
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
" THANKS: https://www.vi-improved.org/recommendations/
```

## Com plugins
- [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
