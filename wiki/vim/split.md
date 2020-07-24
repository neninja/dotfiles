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
<c-w>h " vai para a split da esquerda
<c-w>j " vai para a split de baixo
<c-w>k " vai para a split de cima
<c-w>l " vai para a split da direita
<c-w>w " vai para a próxima split
<c-w>W " vai para a split anterior
<c-w><c-r> " rotarionasplit

" Redimentionamento
<c-w>-  " diminui altura
<c-w>+  " aumenta altura
<c-w>_  " aumenta altura da split ao máximo"
<c-w><  " diminui largura
<c-w>>  " aumenta largura
<c-w>|  " Aumenta largura da split ao máximo
<c-w>=  " Reseta tamanhos das splits
:set winwidth=999  " ajusta dinamicamente a largura da split para a maior possível
:set winheight=999 " ajusta dinamicamente a altura da split para a maior possível
```

### Maps (sugestões)
```vim
nnoremap    <c-h>       <c-w>h
nnoremap    <c-j>       <c-w>j
nnoremap    <c-k>       <c-w>k
nnoremap    <c-l>       <c-w>l
```

## Com plugins
- Movimentação:
    - `-` e `<letra>` com [win-choosewin](https://github.com/t9md/vim-choosewin) 
- Criação:
    - `<c-v>` ou `<c-h>` no arquivo com [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
## Configurações (sugestões)
```vim
set splitbelow  " cria split horizontal abaixo
set splitright  " cria split vertical abaixo
```
