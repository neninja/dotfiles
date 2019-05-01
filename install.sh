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
# Utilização:
#   ./install.sh
#
# ---------------------------------------------------------- #
# Testes:
#
# bash --version #versão do bash
#   4.4.19
#
# Sistema operacional:
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

# x
ln -v -s -f $(pwd)/x/.xinitrc $HOME/.xinitrc
ln -v -s -f $(pwd)/x/.Xdefaults $HOME/.Xdefaults

# calcurse
mkdir -p ~/.calcurse
ln -s $HOME/dev/dotfiles/calcurse ~/.calcurse
#ln -v -s -f $(pwd)/calcurse/conf $HOME/.calcurse/conf
#ln -v -s -f $(pwd)/calcurse/keys $HOME/.calcurse/keys
#ln -v -s -f $(pwd)/calcurse/todo $HOME/.calcurse/todo

# neomutt
# links simbolicos para diretórios devem possuir caminhos absolutos
rm -r ~/.config/mutt
ln -s $HOME/dev/dotfiles/mutt ~/.config/mutt

# git
ln -v -s -f $(pwd)/git/.gitconfig $HOME/.gitconfig

# nvim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.config/nvim/init.vim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.vimrc

# qutebrowser
mkdir -p ~/.config/qutebrowser/bookmarks
ln -v -s -f $(pwd)/qutebrowser/urls $HOME/.config/qutebrowser/bookmarks/urls
ln -v -s -f $(pwd)/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
