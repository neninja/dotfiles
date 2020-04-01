# Vim
## TODO
- [ ] Reload vimrc e plugins
- [ ] Gerenciamento de packages
    - [ ] tentar instalar packages automaticamente sem o script
    - [ ] gerar helptags ``:helptags ALL`` e ``vim -u NONE -c "helptags fugitive/doc" -c q``
- [X] Snippets
    - [X] trigger opcional
    - [X] devem aparecer em popup
    - [X] labels com highlight
- [ ] go to definition (ctags)
- [X] folding
    - [X] usar foldmark de markdown (#) semelhante ao org-mode
    - [X] teclas de atalho
- [o] git
    - [ ] não ser afetado ao salvar um arquivo no vim e alterar ^M
    - [X] stage/unstage facilmente
    - [ ] commit rápido
    - [X] stage um arquivo rápido
    - [X] diff de modifieds/stageds/untrackeds com a HEAD
    - [ ] diff de merge conflicts
- [ ] melhorar thenfeite (desacoplar definição de cores de temas)

## Necessidades como editor dev
### MVP
- [X] Leve e rápido
- [X] Instalável em Windows e diversas distros Linux
- [X] [Customizável (temas, highlights, shortcuts, comportamentos)](vim/rc.md)
- [X] [Configurável através de dotfiles](vim/dotfiles)
- [X] Numerar linhas
- [X] Detectar diferentes filetypes
- [X] Auto identar e comando de identação para diversos filetypes
- [X] [Fuzzy finder](vim/fuzzy.md)
- [X] Snippets
- [ ] Linter
- [X] Integração de formatação por ferramentas
- [ ] Intelisense (go to definition)
- [ ] Autocomplete (variaveis usadas, metodos de classe da variavel)
- [ ] [Integração com o git](vim/git.md)
- [X] Criação de paineis
- [X] Comentar e descomentar trecho de código ou linha
- [X] Search e search/replace no arquivo
- [ ] Search em todo o projeto
- [ ] Criar, mover/renomear e deletar arquivos/diretórios
- [X] Atualizar o arquivo aberto caso seja modificado por outro editor/comando
- [X] Folds

### Bonus
- [ ] Debug
- [ ] Exibir output da execução do arquivo
- [ ] Exibir output de trechos do arquivo
- [X] Ser acessível pelo terminal
- [X] Gravar macros de edição de texto
- [ ] Suporte a emojis

## Dicas
- https://vim.rtorr.com/lang/pt_br
- https://vimways.org/2018/

## Configurações legais
- https://github.com/BrodieRobertson/dotfiles/blob/master/config/nvim/init.vim
