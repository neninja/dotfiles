# [dotfiles](http://d.neni.dev)

[![emojicom](https://img.shields.io/badge/emojicom-%F0%9F%90%9B%20%F0%9F%86%95%20%F0%9F%92%AF%20%F0%9F%91%AE%20%F0%9F%86%98%20%F0%9F%92%A4-%23fff)](http://neni.dev/emojicom)

Versionamento dos meus arquivos de configuração, scripts, instruções e templates usados no Windows e/ou Linux.

- Nvim e VSCode
- Awesome
- Bash e Git

> [Vimrc](http://neni.dev/vimrc) simplificado e ["estilizado"](http://vimrc.neni.dev)

## Download

> No Windows `%userprofile%` equivale `~`

- nvim
```bash
# Ubuntu
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
```

- configurar Nvim, Git e Bash
```bash
cd ~
mkdir -p dev
cd dev
git clone git@github.com:nenitf/dotfiles.git
cd dotfiles
./install.sh
```

## Configurações locais

### Nvim

- `~/.vimrc-pre.vim`
- `~/.vimrc-local.vim`
- `/path/do/projeto/.exvrc`

#### Compatibilidade básica com o vim

```vim
" ~/.vimrc ou %userprofile%\_vimrc
let g:dotfiles = "~/dev/dotfiles/"
exe "source ".g:dotfiles."nvim/vimrc"
exe "source ".g:dotfiles."nvim/colors/calmo.vim"
```

### Bash

- `~/.bashrc-local.sh`

### Git

- `~/.gitconfig-local`

#### Exemplo

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
