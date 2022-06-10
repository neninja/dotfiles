# [dotfiles](http://d.neni.dev)

[![emojicom](https://img.shields.io/badge/emojicom-%F0%9F%90%9B%20%F0%9F%86%95%20%F0%9F%92%AF%20%F0%9F%91%AE%20%F0%9F%86%98%20%F0%9F%92%A4-%23fff)](http://neni.dev/emojicom)

Versionamento dos meus arquivos de configuração, scripts, instruções e templates usados no Windows e/ou Linux.

> No Windows `%userprofile%` equivale `~`

## Estrutura do repositório

- [awesomewm/](awesomewm/): configurações do [awesome](https://awesomewm.org)
- [modelos/](/modelos): arquivos que frequentemente preciso ver ou copiar
    - [sample-dot-graph/](/modelos/sample-dot-graph): exemplos da utilização de graphviz
    - [git/](/modelos/git): arquivos usados com git ou github
- [vim/](/vim): arquivos de [configuração](http://vim.neni.dev) do [vim](https://www.vim.org/)
    - [doc/wtf.txt](/vim/doc/wtf.txt): documentação (`:h wtf`)
    - [ftplugin/](/vim/ftplugin): especificações de `filetypes`
    - [syntax/](/vim/syntax): sintaxes específicas de `filetypes`
    - [dicionarios/](/vim/dicionarios/): dicionários usados para sugerir palavras no vim com <kbd>CTRL</kbd><kbd>X</kbd><kbd>CTRL</kbd><kbd>K</kbd>
    - [colors/](/vim/colors/): definição de cores para grupos de highlights (colorschemes)
    - [skeletons/](/vim/skeletons/): estrutura inicial de tipos de arquivos
    - [clone-packages.sh](/vim/clone-packages.sh): download de packages (plugins)
    - [dotfiles.vim](/vim/dotfiles.vim): configurações do vim caso este projeto seja clonado por inteiro, pois ele considera estrutura de pastas
    - [plus.vim](/vim/plus.vim): configurações a mais que podem afetar performance do vim
    - [gvimrc](/gvim/gvimrc): configurações de interface gráfica do gvim
    - [packages.vim](/vim/packages.vim): configurações específicas de packages do vim
    - [vimrc](/vim/vimrc): configurações do vim, funciona de maneira independente do projeto ([prévia](http://vimrc.neni.dev))
    - [vi](/vim/vi): configurações do vi, usado em servidores sem vim. Deve ser posto em `.vimrc`
        - `curl https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/vi > $HOME/.vimrc`
        - `wget https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/vi -O $HOME/.vimrc`
- [.bashrc](.bashrc): configurações bash (alias, path, functions, ps e etc).
- [.gitconfig](.gitconfig): configuração do git
- [install.sh](install.sh): "instalação" dos arquivos de configuração no Linux e Windows

## Download

Os arquivos normalmente referenciam o path `~/dev/dotfiles/`, portanto clone o projeto corretamente

```bash
cd ~
mkdir -p dev
cd dev
git clone git@github.com:nenitf/dotfiles.git
cd dotfiles
./install.sh
```

## Configurações locais

### Vim

- **Antes** do `vim/vimrc`: `~/.vimrc-pre.vim`
- **Depois** do `vim/vimrc`: `~/.vimrc-local.vim`
- **Depois** do `vim/gvimrc`: `~/.gvimrc-local.vim`
- Exemplos em `vim/doc/wtf.txt`

### Bash

- Em `~/.extra-bashrc.sh`

### Git

- Em `~/.gitconfig-extra`
- Exemplo comum:

```gitconfig
# `~/.gitconfig-extra`
[includeIf "gitdir:~/dev/trampo/projetox/"]
    path = dev/trampo/.gitconfig-projetox
```

```gitconfig
# `~/dev/trampo/.gitconfig-projetox`
[include]
    path = .gitconfig-geral-trampo
[core]
    excludesfile = ~/dev/trampo/.gitignore-projetox
```

```gitconfig
# `~/dev/trampo/.gitconfig-geral-trampo`
[user]
    name = Felipe Silva
    email = felipe@trampo.com
    username = felipe_silva
[alias]
    s = status
    commit-guide = !cat ~/dev/dotfiles/modelos/git/.gitcommit
    pr = "!f() { git fetch upstream && rebase upstream/$@; }; f"
```

## Atualização forçada

```bash
git fetch --all
git reset --hard origin/main
```

## Adendos

- [Wiki](https://github.com/nenitf/dotfiles/wiki)
