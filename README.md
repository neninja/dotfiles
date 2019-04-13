# dotfiles
Os arquivos são guardados e referenciados principalmente por aliases à pasta cpfiles através do path ``~/dev/dotfiles/``, portanto é imprescindível manter esta mesma estrutura.

## Install

```bash
wget -O - http://neni.dev/dotfiles/lazy.sh | sh
```

or
 
```bash
cd ~
mkdir dev
cd dev
git clone https://github.com/nenitf/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

## Atualização forçada

```bash
git fetch --all
git reset --hard origin/master
```
