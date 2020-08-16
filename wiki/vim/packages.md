# packages

Todos de terceiros estão clonados em start ou opt pelo path:
- `~/vimfiles/pack/vendor/` no Windows
- `~/.vim/pack/vendor/` no Linux

Plugins próprios em:
- `~/vimfiles/pack/nenitf/` no Windows
- `~/.vim/pack/nenitf/` no Linux

> THANKS :https://vimhelp.org/repeat.txt.html#packages

<!-- TODO criar package manager como vim-plug, para substituir script de clone -->

```vim
:helptags ALL
:helptags ~/vimfiles/pack/vendor/start/*/doc
```
```
vim -u NONE -c "helptags fugitive/doc" -c q
```
