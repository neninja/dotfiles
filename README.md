# dotfiles
Os arquivos são guardados e referenciados principalmente por aliases à pasta cpfiles através do path ``~/dev/dotfiles/``, portanto é imprescindível manter esta mesma estrutura.

## Programas
* git
* calcurse
* mpv
* qutebrowser
* zathura
* nvim
* neomutt
* feh
* newsboat

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

## Todo
* [] Neomutt: Offline imap emails;
* [] Neomutt: Offline imap contacts;
* [] Neomutt: GPG com passwords;
* [] Calcurse: Calendario do gmail;
