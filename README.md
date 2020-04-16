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

- [arquivados/](arquivados/): configurações antigas de programas que não uso
- [modelos/](/modelos): arquivos que frequentemente preciso ver ou copiar
    - [latex/](/modelos/latex): templates/classes latex
    - [sample-dot-graph/](/modelos/sample-dot-graph): exemplos da utilização de graphviz
    - [git/](/modelos/git): arquivos usados com git ou github
- [vim/](/vim): arquivos de configuração do [vim](https://www.vim.org/)
    - [after/](/vim/after/): [Comportamentos](/vim/after/ftplugin) e [cores](/vim/after/syntax) específicas (js, python, php ...)
    - [dicionarios/](/vim/dicionarios/): dicionários usados para sugerir palavras
    - [skeletons/](/vim/skeletons/): estrutura inicial de tipos de arquivos
    - [clone-packages.sh](/vim/clone-packages.sh): download de packages (plugins)
    - [dotfiles.vim](/vim/vimrc): configurações do vim caso este projeto seja clonado por inteiro, pois ele considera estrutura de pastas
    - [gvimrc](/gvim/gvimrc): configurações de interface gráfica do gvim
    - [packages.vim](/vim/packages.vim): configurações específicas de packages do vim
    - [vimrc](/vim/vimrc): configurações do vim, funciona de maneira independente do projeto
- [wiki/](/wiki): anotações pessoais
- [.bashrc](bash.rc): configurações bash (alias, path, functions, ps e etc).
- [.gitconfig](/git/config): configuração do git
- [index.html](index.html): redirecionamento do github-pages para o script de instalação
- [install.sh](install.sh): "instalação" dos arquivos de configuração no Linux e Windows

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
