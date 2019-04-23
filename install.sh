#!/usr/bin/env bash
#
# install.sh - Padrão de instalação inicial no linux
#
# Site:             neni.dev/dotfiles
# Autor/Mantenedor: Felipe Silva - github.com/nenitf
# ---------------------------------------------------------- #
# Esse sript linka arquivos de configuração (dotfiles)
# selecionados para linux
#
# Utilização comum:
#   chmod +x install.sh
#   ./install.sh
#
# Utilização para testes:
#   chmod +x install.sh
#   ./install.sh -t
# ---------------------------------------------------------- #
# Testes:
#
# bash --version #versão do bash
#   4.4.19
#
# Sistema operacional:
#   Lubuntu 18.10 em:
#   Xubuntu 18.10 em:
#   Ubuntu Minimal 18.04 em:
# ---------------------------------------------------------- #
# Agradecimentos:
#
# Matheus Muller:
#   https://www.udemy.com/shell-script-do-basico-ao-profissional/
#
# gbencke durante o meetup de python:
#   https://github.com/gbencke
#
# A todos que disponibilizaram seus dotfiles online:
#   Luke Smith: https://github.com/LukeSmithxyz/voidrice
#   Filipe Deschamps: https://github.com/filipedeschamps/dotfiles
#   gbencke: https://github.com/gbencke/dotfiles
#   Denys Dovhan: https://github.com/denysdovhan/dotfiles
#   Mathias Bynens: https://github.com/mathiasbynens/dotfiles
#   Lars Kappert: https://github.com/webpro/dotfiles
#   Lars Kappert: https://github.com/webpro/awesome-dotfiles
# ---------------------------------------------------------- #

# -------------------------- MAIN -------------------------- #
mkdir -p $HOME/.config

# bash
ln -v -s -f $(pwd)/bash/.bashrc $HOME/.bashrc
ln -v -s -f $(pwd)/bash/.inputrc $HOME/.inputrc

# urxvt
ln -v -s -f $(pwd)/urxvt/.xinitrc $HOME/.xinitrc
ln -v -s -f $(pwd)/urxvt/.Xdefaults $HOME/.Xdefaults
mkdir -p ~/.urxvt
mkdir -p ~/.urxvt/ext
ln -v -s -f $(pwd)/urxvt/resize-font $HOME/.urxvt/ext/resize-font

# i3
mkdir -p $HOME/.config/i3
ln -v -s -f $(pwd)/i3/config $HOME/.config/i3/config
ln -v -s -f $(pwd)/i3/.i3blocks.conf $HOME/.i3blocks.conf

# ranger
mkdir -p $HOME/.config/ranger
ln -v -s -f $(pwd)/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -v -s -f $(pwd)/ranger/commands.py $HOME/.config/ranger/commands.py

# git
ln -v -s -f $(pwd)/git/.gitconfig $HOME/.gitconfig

# nvim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.config/nvim/init.vim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.vimrc

# qutebrowser
ln -v -s -f $(pwd)/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
mkdir -p ~/.config/qutebrowser/bookmarks
ln -v -s -f $(pwd)/qutebrowser/urls $HOME/.config/qutebrowser/bookmarks/urls
