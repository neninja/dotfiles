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
ln -vsf $(pwd)/bash/.bashrc $HOME/.bashrc
ln -vsf $(pwd)/bash/.inputrc $HOME/.inputrc

# x
ln -vsf $(pwd)/x/.xinitrc $HOME/.xinitrc
ln -vsf $(pwd)/x/.Xdefaults $HOME/.Xdefaults

# feh
mkdir -p ~/.config/feh
ln -vsf $(pwd)/feh/.fehbg $HOME/.fehbg
ln -vsf $(pwd)/feh/.fehbg $HOME/.config/feh/keys

# calcurse
rm -r ~/.calcurse
ln -s $HOME/dev/dotfiles/calcurse ~/.calcurse
#ln -vsf $(pwd)/calcurse/conf $HOME/.calcurse/conf
#ln -vsf $(pwd)/calcurse/keys $HOME/.calcurse/keys
#ln -vsf $(pwd)/calcurse/todo $HOME/.calcurse/todo

# neomutt
# links simbolicos para diretórios devem possuir caminhos absolutos, sem pwd
rm -r ~/.config/neomutt
ln -s $HOME/dev/dotfiles/neomutt ~/.config/neomutt

# git
ln -vsf $(pwd)/git/.gitconfig $HOME/.gitconfig

# nvim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.config/nvim/init.vim
echo 'source ~/dev/dotfiles/nvim/.nvimrc' > ~/.vimrc

# qutebrowser
mkdir -p ~/.config/qutebrowser/bookmarks
ln -vsf $(pwd)/qutebrowser/urls $HOME/.config/qutebrowser/bookmarks/urls
ln -vsf $(pwd)/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
