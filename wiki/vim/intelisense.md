# Intelisense (go to definition)

## Com ctags

> Para usar ctags o comando deve ser `ctags -R .`

- `:ts {word}` ou `g]` sobre a `word`
- `<c-]>` vai para definição da tag
    - `<c-]>` não funciona no teclado brasileiro ([issue](https://github.com/vim/vim/issues/1378)), a solução é mapear para `<c-\>`
- `<c-t>` volta antes do pulo da tag
