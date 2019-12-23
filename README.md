# dotfiles
## TL;DR
Versionamento dos meus arquivos de configuração, scripts ou templates usados no Windows e/ou Linux.

Os arquivos são guardados e referenciados principalmente através do path ``~/dev/dotfiles/``, portanto é imprescindível manter esta mesma estrutura.

## Programas
* bash
* dialog
* feh
* git
* vim
* x
* zathura

## Install linux
 
```bash
cd ~
mkdir dev
cd dev
git clone https://github.com/nenitf/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

## Install windows
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

## Atualização forçada

```bash
git fetch --all
git reset --hard origin/master
```

## Todo
* [ ] Windows CMD/PS: Alias para git
* [ ] Windows CMD/PS: Output como UTF-8 para ver acentuações nos commits
