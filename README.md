# dotfiles

[![emojicom](https://img.shields.io/badge/emojicom-%F0%9F%90%9B%20%F0%9F%86%95%20%F0%9F%92%AF%20%F0%9F%91%AE%20%F0%9F%86%98%20%F0%9F%92%A4-%23fff)](http://neni.dev/emojicom)

## TL;DR

Versionamento dos meus arquivos de configuração, scripts ou templates usados no Windows e/ou Linux.

Os arquivos são guardados e referenciados principalmente através do path ``~/dev/dotfiles/``, portanto é imprescindível manter esta mesma estrutura.

## Programas
* bash
* git
* vim
* emacs/doom

## Estrutura do repositório

- [awesomewm/](awesomewm/): configurações do [awesome](https://awesomewm.org)
- [modelos/](/modelos): arquivos que frequentemente preciso ver ou copiar
    - [sample-dot-graph/](/modelos/sample-dot-graph): exemplos da utilização de graphviz
    - [git/](/modelos/git): arquivos usados com git ou github
- [vim/](/vim): arquivos de configuração do [vim](https://www.vim.org/)
    - [doc/wtf.txt](/vim/doc/wtf.txt): documentação das minhas configurações (`:h wtf`)
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
    - [vimrc](/vim/vimrc): configurações do vim, funciona de maneira independente do projeto
    - [vi](/vim/vi): configurações do vi, usado em servidores sem vim. Deve ser posto em `.vimrc`
        - `curl https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/vi > $HOME/.vimrc`
        - `wget https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/vi -O $HOME/.vimrc`
- [wiki/](/wiki): anotações pessoais
- [.bashrc](.bashrc): configurações bash (alias, path, functions, ps e etc).
- [.gitconfig](.gitconfig): configuração do git
- [install.sh](install.sh): "instalação" dos arquivos de configuração no Linux e Windows

## Download
### Parcial do vim
Caso queira somente a configuração básica do vim, basta copiar o conteúdo de [vimrc](/vim/vimrc) e [gvimrc](/vim/gvimrc) para respectivamente:
- `%userprofile%\_vimrc` e `%userprofile%\_gvimrc` no Windows
```sh
curl https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/vimrc > %userprofile%\_vimrc
curl https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/gvimrc > %userprofile%\_gvimrc
```
- `$HOME/.vimrc` e `$HOME/.gvimrc` no Linux
```sh
wget https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/vimrc -O $HOME/.vimrc
wget https://raw.githubusercontent.com/nenitf/dotfiles/main/vim/gvimrc -O $HOME/.gvimrc
```

### Completa

```bash
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
git reset --hard origin/main
```

## Adendos

### Vim

- Caso precise configurar scripts que devem rodar **antes** do `vim/vimrc`, crie o arquivo `~/.vimrc-pre.vim` (equivale `%userprofile%\.vimrc-pre.vim` no Windows).
- Caso precise configurar scripts que devem rodar **depois** do `vim/vimrc`, crie o arquivo `~/.vimrc-local.vim` (equivale `%userprofile%\.vimrc-local.vim` no Windows).
- Caso precise configurar scripts que devem rodar **depois** do `vim/gvimrc`, crie o arquivo `~/.gvimrc-local.vim` (equivale `%userprofile%\.gvimrc-local.vim` no Windows).
- Utilize os helptags (`:h wtf`) gerados para saber mais sobre os detalhes das configurações (exemplo: `:h wtf-autocomplete`). Para atualizá-los utilize ``:helptags ~/dev/dotfiles/vim/doc``.
- Instale Ag para melhorar nas buscas com [`:GrepperAgP`](https://github.com/ggreer/the_silver_searcher)
