# dotfiles
## TL;DR
Versionamento dos meus arquivos de configuração, scripts ou templates usados no Windows e/ou Linux.

Os arquivos são guardados e referenciados principalmente através do path ``~/dev/dotfiles/``, portanto é imprescindível manter esta mesma estrutura.

## Programas
* bash
* dialog
* git
* vim
* x
* zathura

## Estrutura do repositório
- [ ] [bash/](/bash): arquivos relacionados a comandos/configurações do bash
    - [ ] [aliases.sh](/bash/aliases.sh): apelidos de comandos
    - [ ] [exports.sh](/bash/exports.sh): variáveis globais
    - [ ] [functions.sh](/bash/functions.sh): funções/comandos
    - [ ] [prompt.sh](/bash/prompt.sh): estilização do prompt
- [ ] [cpfiles/](/cpfiles): arquivos que frequentemente preciso copiar ou ter acesso
    - [ ] [git/](/cpfiles/git): arquivos relacionados a projetos
        - [ ] [COMMIT_MSG.md](/cpfiles/git/COMMIT_MSG.md): convenção de mensagens de commits
        - [ ] [CONTRIBUTING.md](/cpfiles/git/CONTRIBUTING.md): instruções para contribuição no repositório
        - [ ] [deploy.sh](/cpfiles/git/deploy.sh): script de deploy para o [github-pages](https://pages.github.com/)/[gitlab-pages](https://docs.gitlab.com/ee/user/project/pages/)
        - [ ] [ISSUE_TEMPLATE](/cpfiles/git/ISSUE_TEMPLATE): template do github para novas issues
        - [ ] [PULL_REQUEST_TEMPLATE](/cpfiles/git/PULL_REQUEST_TEMPLATE): template do github para PRs
        - [ ] [UNLICENSE](/cpfiles/git/UNILICENSE): "licença" favorita para projetos
    - [ ] [latex/](/cpfiles/latex): templates/classes latex
        - [ ] [apostila.cls](/cpfiles/latex/apostilas.cls): template para apostilas
        - [ ] [slides.cls](/cpfiles/latex/slides.cls): template para slides beamer
    - [ ] [sample-dot-graph](/cpfiles/sample-dot-graph): exemplos da utilização de graphviz
- [ ] [dialog/](/dialog): configurações [dialog](http://linuxcommand.org/lc3_adv_dialog.php)
    - [ ] [.dialogrc](/dialog/.dialogrc)
- [ ] [git/](/git): arquivos de configuração do git
    - [ ] [config](/git/config): configuração do git
    - [ ] [.gitcommit](/git/.gitcommit): template de commits
    - [ ] [.gitconfig](/git/.gitconfig): arquivo que vai para `$HOME/.gitconfig` ou `%userprofile%\.gitconfig` e importa [config](/git/config). Tornando desnecessário link simbólico
    - [ ] [.gitconfig-old](/git/.gitconfig-old): configurações antigas com muitos comandos que não domino ainda...
- [ ] [vim/](/vim): arquivos de configuração do [vim](https://www.vim.org/)
    - [ ] [dicionarios/](/vim/dicionarios/): dicionários usados para sugerir palavras
    - [ ] [plugins/](/vim/plugins/): scripts baixados
    - [ ] [skeletons/](/vim/skeletons/): estrutura inicial de tipos de arquivos
    - [ ] [snippets/](/vim/snippets/): trechos de códigos
    - [ ] [base.vim](/vim/base.vim): configurações do vim, funciona de maneira independente do projeto
    - [ ] [base-dotfiles.vim](/vim/base-dotfiles.vim): complemento as configurações, porém exige a estrutura de arquivos do projeto (snippets, skeletons e etc)
    - [ ] [gvim.vim](/vim/gvim.vim): configurações de interface gráfica do gvim
    - [ ] [gvimrc](/git/gvimrc): arquivo que vai para `$HOME/.gvimrc` ou `%userprofile%\_gvimrc` e importa os demais existentes, evitando links simbólicos. Permite adicionar um arquivo de configuração que não será versionado em `$HOME` ou `%userprofile%`
    - [ ] [plugins.vim](/vim/plugins.vim): configurações específicas de plugins do vim
    - [ ] [thenfeite.vim](/vim/thenfeite.vim): tema de cores do vim
    - [ ] [vimrc](/git/gvimrc): arquivo que vai para `$HOME/.vimrc` ou `%userprofile%\_vimrc` e importa os demais existentes, evitando links simbólicos. Permite adicionar um arquivo de configuração que não será versionado em `$HOME` ou `%userprofile%`
- [ ] [wiki/](/wiki): anotações que devem ser versionadas
    - [ ] [concursos/](/wiki/concursos): pasta com conteúdo/referências de estudo e etc sobre concursos prestados
    - [ ] [estudos.md](/wiki/estudos.md): observações sobre conteúdos
    - [ ] [index.md](/wiki/index.md): indice dos arquivos da wiki (usado pelo vim para navegação)
    - [ ] [linux.md](/wiki/linux.md): anotações sobre o ambiente linux
    - [ ] [vim.md](/wiki/vim.md):  anotações sobre o vim
- [ ] [x/](/x):
    - [ ] [.Xdefaults](/x/.Xdefaults):
    - [ ] [.xinitrc](/x/.xinitrc):
    - [ ] [.Xresources](/x/.Xresources):
- [ ] [zathurarc/](/zathurarc): configurações [zathura](https://wiki.archlinux.org/index.php/Zathura)
    - [ ] [zathurarc](/zathurarc/zathurarc): configurações zathura
- [ ] [index.html](index.html): redirecionamento do github-pages para o script de instalação
- [ ] [install.bat](install.bat): "instalação" dos arquivos de configuração no windows
- [ ] [install.sh](install.bat): "instalação" dos arquivos de configuração no Linux
- [ ] [install-vim-plugins.sh](install-vim-plugins.sh): clona os plugins do vim
- [ ] [README.md](README.md): este documento...
- [ ] [UNLICENSE](UNLICENSE): licença do repositório

## Instalação
### Parcial do vim
Caso queira somente a configuração básica do vim, basta copiar o conteúdo de [base.vim](/vim/base.vim) e [gvim.vim](/vim/gvim.vim) para respectivamente:
- `%userprofile%\_vimrc` e `%userprofile%\_gvimrc` no Windows
- `$HOME/.vimrc` e `$HOME/.gvimrc` no Linux
    - Via terminal:
    ```sh
    wget https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/base.vim -O $HOME/.vimrc
    wget https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/gvim.vim.vim -O $HOME/.gvimrc
    ```

### Completa no linux
```bash
wget -O - http://neni.dev/dotfiles/lazy.sh | sh
```
ou
```bash
cd ~
mkdir dev
cd dev
git clone https://github.com/nenitf/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
chmod +x install-vim-plugins.sh
./install-vim-plugins.sh
```

### Completa no windows
 <!-- Inserir tutorial de configuração windows -->
```bash
# no git bash
cd ~
mkdir dev
cd dev
git clone https://github.com/nenitf/dotfiles.git
cd dotfiles
./install.bat
```
> É necessário possuir bash para executar a instalação dos plugins do vim

## Atualização forçada

```bash
git fetch --all
git reset --hard origin/master
```

## Todo
* [ ] Windows CMD/PS: Alias para git
* [ ] Windows CMD/PS: Output como UTF-8 para ver acentuações nos commits
* [ ] Tornar local dos dotfiles mais dinâmico
