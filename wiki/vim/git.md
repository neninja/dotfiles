# Integração com o git

## Stage e commit rápido em um arquivo
### Sem plugins
```vim
:!git add %
:!git commit
```
### Com plugin
[fugitive](https://github.com/tpope/vim-fugitive)
```vim
:Gw
:Gcommit
```

## Mostrar todos os arquivos modificados
### Sem plugins
```vim
:!git status -s
```
### Com plugin
[fugitive](https://github.com/tpope/vim-fugitive)
```vim
:G
```

## Commitar, Stage ou unstage rapidamente em vários arquivos
### Sem plugins
<!-- TODO -->
```vim
```
### Com plugin
[fugitive](https://github.com/tpope/vim-fugitive)
```vim
:G

" escolher arquivo (navegação com ')' e '(')
"   - (hifen) toggle stage um arquivo
"   = (igual) toggle inline diff

" commit comum
cc

" commit ammend editando a mensagem
ca

" commit ammend sem editar a mensagem
ce
```

## Comparar alterações, add ou remover elas rapidamente
### Sem plugins
<!-- TODO -->
```vim
```
### Com plugin
[fugitive](https://github.com/tpope/vim-fugitive)

- Método 1: Atraves do Gstatus com inline diff
```vim
:G

" escolher arquivo (navegação com ')' e '(')
" exibir inline diff com = (igual)
" stagear trecho de código selecionando e apertando - (hifen)

" commit comum
cc

" commit ammend editando a mensagem
ca

" commit ammend sem editar a mensagem
ce
```
 
- Método 2: Atraves do DiffSplit
```vim
" THANKS: https://vi.stackexchange.com/questions/10368/git-fugitive-how-to-git-add-a-visually-selected-chunk-of-code
" THANKS: https://vi.stackexchange.com/a/10370/28875
" THANKS: http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/

" Duas formas de abrir a split:
" PRIMEIRA:
"   - Abrir Gstatus
:G
"   - escolher arquivo (navegação com ')' e '(')
"   - abrir diffplit com dv
"       - OBS: O cursor vai para o arquivo work (mais detalhes a frente)
"       - OBS2: O unstage parcial só pode ser feito desse método
"
"
" SEGUNDA:
"   - Abrir arquivo
"   - Usar o comando de split"
"       - OBS: O cursor vai para o arquivo index (mais detalhes a frente)
:GdiffSplit


" 1. O arquivo aberto aberto a esquerda é o "index" e a direita o "work"
"   - index: estado do arquivo commitado, antes das alterações, as modificações
"       deste arquivo que serão commitadas (precisa ser salvo a cada modificação)
"   - arquivo sendo modificado e posteriormente commitado
"
" 2. Dependendo de onde estiver o cursor os comandos para adicionar ou remover
" invertem, pois eles "mudam de contexto". 
"
" 3. Os comandos são:
"   - :diffget ou do (do não pode ser usado em modo visual): COPIA/PEGA o trecho 
"       respectivo de código do outro buffer
"   - :diffput ou dp (dp não pode ser usado em modo visual): COLA/ENVIA o trecho
"       respectivo de código do outro buffer
"
" 4. Contextos explicados:
"   - cursor no index:
"       :diffget stage o texto pego
"       :diffput desfaz o texto enviado (PERIGOSO!)
"   - cursor no work:
"       :diffget desfaz o texto pego (PERIGOSO!) 
"       :diffput stage o texto enviado
"
" 5. MEU fluxo favorito:
"   - :G
"   - dv
"   - <c-w>h
"   - :diffget para add ou :diffput para remover
"   - ZZ (:wq)
"
"
" OBS: talvez seja necessário :diffupdate para atualizar highlight do diff

" commitar com :Gcommit ou no :G com cc, ca ou ce
```

## Resolver conflitos
### Sem plugins
<!-- TODO -->
```vim
```

### Com plugins
[fugitive](https://github.com/tpope/vim-fugitive)
```vim
" THANKS: http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/

"   - :G
"   - dv
"   - usar na janela do meio :diffget <numero-buffer-da-direita-ou-esquerda>
"   - ZZ (:wq)
"
"
" OBS: [c ]c navega entre as modificações
```

## Mostrar pontos de alterações no arquivo
### Sem plugins
<!-- TODO -->
```vim
```
### Com plugin
[GitGutter](https://github.com/airblade/vim-gitgutter)
```vim
:GitGutterToggle
```

## Stage dos hunks
### Sem plugins
<!-- TODO -->
```vim
```
### Com plugin
[GitGutter](https://github.com/airblade/vim-gitgutter)
```vim
<leader>hs
```

## Blame
### Sem plugins
<!-- TODO -->
```vim
```
### Com plugin
[fugitive](https://github.com/tpope/vim-fugitive)
```vim
:Gblame
```
