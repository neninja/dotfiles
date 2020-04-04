# Atualizar arquivo

```vim
" checar/atualizar quando o texto for modificado (por outro editor)
set autoread
au FocusGained,BufEnter * :silent!<space>!
```
