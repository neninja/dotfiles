# dotfiles
## TL;DR
Versionamento dos meus arquivos de configuração, scripts ou templates usados no Windows e/ou Linux.

Os arquivos são guardados e referenciados principalmente através do path ``~/dev/dotfiles/``, portanto é imprescindível manter esta mesma estrutura.

## Programas
* bash
* git
* vim
* x
* zathura

## Estrutura do repositório
- [bash/](/bash): arquivos relacionados a comandos/configurações do bash
    - [.inputrc](/bash/.inputrc)<!-- TODO rever -->
    - [aliases.sh](/bash/aliases.sh): apelidos de comandos
    - [config](/bash/aliases.sh): importação de todas configurações
    - [exports.sh](/bash/exports.sh): variáveis globais
    - [functions.sh](/bash/functions.sh): funções/comandos
    - [prompt.sh](/bash/prompt.sh): estilização do prompt
- [cpfiles/](/cpfiles): arquivos que frequentemente preciso copiar ou ter acesso
    - [latex/](/cpfiles/latex): templates/classes latex
        - [apostila.cls](/cpfiles/latex/apostilas.cls): template para apostilas
        - [slides.cls](/cpfiles/latex/slides.cls): template para slides beamer
    - [sample-dot-graph](/cpfiles/sample-dot-graph): exemplos da utilização de graphviz
- [dialog/](/dialog): configurações [dialog](http://linuxcommand.org/lc3_adv_dialog.php)
    - [.dialogrc](/dialog/.dialogrc): configuração de cores do dialog (TUI)
- [git/](/git): arquivos de configuração do git
    - [.gitcommit](/git/.gitcommit): template de commits
    - [.gitconfig](/git/config): configuração do git
    - [.gitconfig-old](/git/.gitconfig-old): configurações antigas com muitos comandos que não domino ainda...
    - [COMMIT_MSG.md](/cpfiles/git/COMMIT_MSG.md): convenção de mensagens de commits
    - [CONTRIBUTING.md](/cpfiles/git/CONTRIBUTING.md): instruções para contribuição no repositório
    - [ISSUE_TEMPLATE](/cpfiles/git/ISSUE_TEMPLATE): template do github para novas issues
    - [PULL_REQUEST_TEMPLATE](/cpfiles/git/PULL_REQUEST_TEMPLATE): template do github para PRs
    - [UNLICENSE](/cpfiles/git/UNILICENSE): "licença" favorita para projetos
    - [deploy.sh](/cpfiles/git/deploy.sh): script de deploy para o [github-pages](https://pages.github.com/)/[gitlab-pages](https://docs.gitlab.com/ee/user/project/pages/)
- [vim/](/vim): arquivos de configuração do [vim](https://www.vim.org/)
    - [after/](/vim/after/): [Comportamentos](/vim/after/ftplugin) e [cores](/vim/after/syntax) específicas (js, python, php ...)
    - [dicionarios/](/vim/dicionarios/): dicionários usados para sugerir palavras
    - [plugins/](/vim/plugins/): scripts baixados
    - [skeletons/](/vim/skeletons/): estrutura inicial de tipos de arquivos
    - [snippets/](/vim/snippets/): trechos de códigos
    - [clone-packages.sh](/vim/clone-packages.sh): download de packages (plugins)
    - [dotfiles.vim](/vim/vimrc): configurações do vim caso este projeto seja clonado por inteiro, pois ele considera estrutura de pastas
    - [gvimrc](/gvim/gvimrc): configurações de interface gráfica do gvim
    - [packages.vim](/vim/packages.vim): configurações específicas de packages do vim
    - [vimrc](/vim/vimrc): configurações do vim, funciona de maneira independente do projeto
- [wiki/](/wiki): anotações que devem ser versionadas
    - [concursos/](/wiki/concursos): pasta com conteúdo/referências de estudo e etc sobre concursos prestados
    - [vim/](/wiki/vim): pasta com conteúdo sobre vim
    - [estudos.md](/wiki/estudos.md): observações sobre conteúdos
    - [index.md](/wiki/index.md): indice dos arquivos da wiki (usado pelo vimwiki para navegação)
    - [linux.md](/wiki/linux.md): anotações sobre o ambiente linux
    - [vim.md](/wiki/vim.md):  anotações sobre o vim
- [x/](/x):
    - [.Xdefaults](/x/.Xdefaults): <!-- TODO rever -->
    - [.xinitrc](/x/.xinitrc): <!-- TODO rever -->
    - [.Xresources](/x/.Xresources): <!-- TODO rever -->
- [zathurarc/](/zathurarc): configurações [zathura](https://wiki.archlinux.org/index.php/Zathura)
- [UNLICENSE](UNLICENSE): licença do repositório
- [index.html](index.html): redirecionamento do github-pages para o script de download
- [install.sh](install.sh): "instalação" dos arquivos de configuração no Linux e Windows
- [lazy.sh](install.sh): "instalação" completa para Ubuntu (incluindo o git) usando apenas wget

## Download
### Parcial do vim
Caso queira somente a configuração básica do vim, basta copiar o conteúdo de [vimrc](/vim/vimrc) e [gvimrc](/vim/gvimrc) para respectivamente:
- `%userprofile%\_vimrc` e `%userprofile%\_gvimrc` no Windows
```
curl https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/vimrc > %userprofile%\_vimrc
curl https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/gvimrc > %userprofile%\_gvimrc
```
- `$HOME/.vimrc` e `$HOME/.gvimrc` no Linux
```sh
wget https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/vimrc -O $HOME/.vimrc
wget https://raw.githubusercontent.com/nenitf/dotfiles/master/vim/gvimrc -O $HOME/.gvimrc
```

### Completa no Linux
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
./install.sh
```

### Completa no Windows
```bash
# no git bash
cd ~
mkdir dev
cd dev
git clone https://github.com/nenitf/dotfiles.git
cd dotfiles
./install.sh
```

## Atualização forçada
```bash
git fetch --all
git reset --hard origin/master
```

## TODO
* [ ] Windows CMD/PS: Alias para git
* [ ] Windows CMD/PS: Output como UTF-8 para ver acentuações nos commits
* [ ] Tornar local dos dotfiles mais dinâmico
