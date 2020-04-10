# Vim
## Configuração desejada
<!-- TODO finalizar checks -->
Configurações que planejo fazer no vim (em ordem)

- [x] folding
    - [x] usar foldmark de markdown (#) semelhante ao org-mode
    - [x] teclas de atalho
- [ ] reload vimrc
- [ ] gerenciamento de packages
    - [ ] tentar instalar/remover packages automaticamente sem bash
    - [ ] gerar helptags ``:helptags ALL`` e ``vim -u NONE -c "helptags fugitive/doc" -c q``
- [ ] snippets
    - [ ] trigger opcional
    - [ ] devem aparecer em popup ([ideia #1](https://vi.stackexchange.com/questions/7750/how-do-i-manage-and-remember-many-abbreviations-in-my-vimrc))
    - [ ] labels com highlight
    - [ ] labels com valores padrão
    - [ ] identar corretamente
    - [ ] transformar em package
- [ ] [git (com e sem plugin)](vim/git.md)
    - [ ] não ser afetado ao salvar um arquivo no vim e alterar `^M`
    - [ ] stage/unstage facilmente
    - [ ] commit rápido
    - [ ] stage um arquivo rápido
    - [ ] diff de modifieds/stageds/untrackeds com a HEAD
    - [ ] diff de merge conflicts
- [ ] netrw
    - [ ] copiar, mover, deletar, renomear um arquivo
    - [ ] copiar, mover, deletar, renomear multiplos arquivos
    - [ ] bookmarks
- [ ] criar tema próprio (thenfeite)
    - [ ] desacoplar configuração para package
    - [ ] definir cores facilmente
    - [ ] definir perfil de cores (light e dark)
    - [ ] definir syntaxes (?)
- [ ] renderizar emojis corretamente
- [ ] Ver syntax/highlight estranha de markdown ou começo a usar o vimwiki

## Aprender sobre o vim
<!-- TODO finalizar checks -->
Lista de comandos, teclas ou funcionalidades para aprender

- [ ] lvim, [:make](https://gist.github.com/ajh17/a8f5f194079818b99199) e [quickfix](http://vimdoc.sourceforge.net/htmldoc/quickfix.html#quickfix)
- [ ] go to definition (ctags)
- [ ] funcionamento de highlight e syntax
- [ ] comandos :diff
- [ ] Ver sobre spellcheck

## Vim como editor principal
Checklist de necessidades básicas/interessantes que o editor deve suprir

### MVP
- [x] [Leve e rápido](vim/leve-e-rapido.md)
- [x] [Instalável em Windows e diversas distros Linux](vim/install.md)
- [x] [Customizável (temas, highlights, shortcuts, comportamentos)](vim/rc.md)
- [x] [Configurável através de dotfiles](vim/dotfiles)
- [x] [Numerar linhas](vim/numero-linha.md)
- [x] [Detectar diferentes filetypes](vim/filetypes.md)
- [x] [Auto indentar e comando de indentação](vim/indent.md)
- [x] [Fuzzy finder](vim/fuzzy.md)
- [x] [Snippets](vim/snippets.md)
- [ ] [Linter](vim/linter.md)
- [ ] [Intelisense (go to definition)](vim/intelisense.md)
- [ ] [Autocomplete (variaveis usadas, metodos de classe da variavel)](vim/autocomplete.md)
- [ ] [Integração com o git](vim/git.md)
- [ ] [Criação de paineis](vim/split.md)
- [ ] [Comentar e descomentar trecho ou linha](vim/comment.md)
- [ ] [Search e search/replace no arquivo](vim/search-replace.md)
- [ ] [Search em todo o projeto](vim/search-replace-project.md)
- [ ] [Criar, mover/renomear e deletar arquivos/diretórios](vim/diretorios.md)
- [x] [Atualizar se modificado em outro lugar](vim/atualizar-arquivo.md)

### Bonus
- [ ] Debug
- [ ] Exibir output da execução do arquivo (ideal para scripts e tdd)
- [ ] Exibir output de trechos do arquivo (repl)
- [x] Ser acessível pelo terminal
- [x] Gravar macros de edição de texto
- [ ] [Suporte a emojis](vim/emojis)

## Vim x Neovim
Lista de problemas em ambos editores

- [ ] Vim issues
    - [ ] Erro com colorsheme com `:source $MYVIMRC`
- [ ] Nvim Issues
    - [ ] Autopopup estranho/pequeno/feio e lento
    - [ ] Instalação no windows precisa do scoop
    - [ ] Paste com <s-insert> não funciona (importante para colar `:comandos`)
    - [ ] Tilde (`~`) não aparece com `~` + `<espaço>`, ruim para `guw` e `gUw`

## Dicas
- [Links (gist)](https://gist.github.com/romainl/4b9f139d2a8694612b924322de1025ce)
- [Vimways](https://vimways.org)
- [Cheat Sheet](https://vim.rtorr.com/lang/pt_br)
- [Vim tips (wiki fandom)](https://vim.fandom.com/wiki/Category:VimTip)
- [Vim uso (wiki fandom)](https://vim.fandom.com/wiki/Category:Usage  )
- [Substituição plugins (reddit)](https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/)
- [Links (reddit)](https://www.reddit.com/r/vim/comments/4dlacf/vim_essentials_articles_videos_ressources/)
- [Recomendações](https://www.vi-improved.org/recommendations/)
- [Vim snippets](https://vimrcfu.com/)
- [Dicas (Steve Losh)](https://stevelosh.com/blog/2010/09/coming-home-to-vim/)
- [Vimscript Hardway](https://learnvimscriptthehardway.stevelosh.com/)
- [Vimbook](https://vimbook.gitbook.io/vimbook/)
- [VimParaNoobs](https://sedilson.github.io/vimparanoobs/index.html)

## Configurações legais
- https://github.com/webpro/awesome-dotfiles
- https://github.com/tpope/tpope/blob/master/.vimrc
- https://github.com/freeo/dotfiles/blob/master/vimrc
- https://github.com/woliveiras/dotfiles/blob/master/bin/system-settings/.vimrc
- https://github.com/BrodieRobertson/dotfiles/blob/master/config/nvim/init.vim
- https://bitbucket.org/sjl/dotfiles/src/default/vim/vimrc
- https://github.com/amix/vimrc/
- https://github.com/nvie/vimrc/blob/master/vimrc
- https://github.com/LukeSmithxyz/voidrice
- https://github.com/filipedeschamps/dotfiles
- https://github.com/gbencke/dotfiles
- https://github.com/denysdovhan/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/webpro/dotfiles
