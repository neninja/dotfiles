# packages

Todos de terceiros estão clonados em start ou opt pelo path:
- `~/vimfiles/pack/vendor/` no Windows
- `~/.vim/pack/vendor/` no Linux

Plugins próprios em:
- `~/vimfiles/pack/nenitf/` no Windows
- `~/.vim/pack/nenitf/` no Linux

> THANKS :https://vimhelp.org/repeat.txt.html#packages

## Documentação local

Para gerar as docs de cada pacote use `:helptags` do vim

```
vim -u NONE -c "helptags ~/dev/dotfiles/vim/doc" -c q
```
