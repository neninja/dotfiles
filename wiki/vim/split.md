# Splits

## Sem plugins
### Comandos
```vim
" Criação
:sp             " abre o mesmo arquivo com divisão horizontal
:vsp            " abre o mesmo arquivo com divisão vertical
:sp <file>      " abre <file> horizontalmente
:vsp <file>     " abre <file> verticalmente

" Movimentação
<c-w><c-h> " vai para a split da esquerda
<c-w><c-j> " vai para a split de baixo
<c-w><c-k> " vai para a split de cima
<c-w><c-l> " vai para a split da direita

" Redimentionamento
<c-w>-  " diminui altura
<c-w>+  " aumenta altura
<c-w>_  " aumenta altura da split ao máximo"
<c-w><  " diminui largura
<c-w>>  " aumenta largura
<c-w>|  " Aumenta largura da split ao máximo
<c-w>=  " Reseta tamanhos das splits
```

### Maps (sugestões)
```vim
noremap     <c-j>       <C-w>w| " estilo DWM
noremap     <c-k>       <C-w>W| " estilo DWM
```

## Com plugins
- Movimentação:
    - `-` e `<letra>` com [win-choosewin](https://github.com/t9md/vim-choosewin) 
- Criação:
    - `<c-v>` ou `<c-h>` no arquivo com [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
## Configurações (sugestões)
```vim
" Criação das splits
set splitbelow
set splitright
```
