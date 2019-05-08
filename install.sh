#!/usr/bin/env bash
#
# install.sh - Padrão de instalação inicial no linux
#
# Site:             neni.dev/dotfiles
# Autor/Mantenedor: Felipe Silva - github.com/nenitf
# ---------------------------------------------------------- #
# Esse sript linka arquivos de configuração (dotfiles)
# selecionados para linux
# ---------------------------------------------------------- #
# Agradecimentos:
#
# Matheus Muller:
#   https://www.udemy.com/shell-script-do-basico-ao-profissional/
#
# gbencke durante o meetup de python em 2018 onde explicou as
# vantagens da portabilidade dos dotfiles:
#   https://github.com/gbencke
#
# Luke por disponibilizar material de alta qualidade sobre linux:
#   http://lukesmith.xyz
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
mkdir -p ~/dev/desh
mkdir -p ~/dev/php
mkdir -p ~/dev/front
mkdir -p ~/go/src/github.com/nenitf
mkdir -p ~/go/src/gitlab.com/nenitf
mkdir -p ~/dev/tex
mkdir -p ~/dev/python

mkdir -p $HOME/.config

# bash
ln -v -s -f $(pwd)/bash/.bashrc $HOME/.bashrc
ln -v -s -f $(pwd)/bash/.inputrc $HOME/.inputrc

# x
ln -v -s -f $(pwd)/x/.xinitrc $HOME/.xinitrc
ln -v -s -f $(pwd)/x/.Xdefaults $HOME/.Xdefaults

# feh
ln -v -s -f $(pwd)/feh/.fehbg $HOME/.fehbg

# calcurse
rm -r ~/.calcurse
ln -s $HOME/dev/dotfiles/calcurse ~/.calcurse
#ln -v -s -f $(pwd)/calcurse/conf $HOME/.calcurse/conf
#ln -v -s -f $(pwd)/calcurse/keys $HOME/.calcurse/keys
#ln -v -s -f $(pwd)/calcurse/todo $HOME/.calcurse/todo

# neomutt
# links simbolicos para diretórios devem possuir caminhos absolutos, sem pwd
rm -r ~/.config/neomutt
ln -s $HOME/dev/dotfiles/neomutt ~/.config/neomutt

# git
ln -v -s -f $(pwd)/git/.gitconfig $HOME/.gitconfig

# nvim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.config/nvim/init.vim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.vimrc

# qutebrowser
mkdir -p ~/.config/qutebrowser/bookmarks
ln -v -s -f $(pwd)/qutebrowser/urls $HOME/.config/qutebrowser/bookmarks/urls
ln -v -s -f $(pwd)/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
