# Spell

## Comandos

- `]s` ir para a próxima palavra errada;
- `[s` voltar para a palavra errada anterior;
- `zg` adicionar a palavra sob o cursor ao dicionário;
- `zug` desfazer a adição;
- `z=` ver sugestões de correção para esta palavra;

## Configurações

```vim
let g:dotfiles_dir = "~/dev/dotfiles"

" lingua da checagem
" BR em capslock gera o aviso: Warning region not supported
set spelllang=pt_br
" local onde está o dicionário local de correções
" THANKS: 
"   - https://github.com/vim/vim/issues/1330
"   - https://extensions.openoffice.org/en/project/vero-brazilian-portuguese-spellchecking-dictionary-hyphenator
"   - https://github.com/vim/vim/files/655099/pt_BR.diff.zip
"   - https://github.com/mateusbraga/vim-spell-pt-br
"   - https://ndvo.wordpress.com/2013/06/05/corretor-ortografico-nativo-do-vim/
"   - https://www.dicas-l.com.br/arquivo/verificacao_ortografica_com_o_editor_vim.php
"   - https://www.vivaolinux.com.br/artigo/Corretor-Ortografico-no-Vim-Guia-definitivo
" no momento não tenho interesse em ficar versionando a adição de palavras
"execute "set rtp+=".g:dotfiles_dir."/vim/spell"

" arquivo que possui as adições do dicionário
" THANKS: https://stackoverflow.com/a/27979576/9881278
execute "set spellfile=".g:dotfiles_dir."/vim/spell/pt.utf-8.add"


" Highlight interessante
highlight SpellBad term=underline gui=undercurl guisp=Orange
```
