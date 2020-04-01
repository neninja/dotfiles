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

mkdir -p $HOME/.config

DIRDF=$HOME/dev/dotfiles

# bash
cp --remove-destination -v $DIRDF/bash/config $HOME/.bashrc

# zathura
mkdir -p $HOME/.config/zathura
cp --remove-destination -v $DIRDF/zathura/zathurarc ~/.config/zathura/zathurarc

# git
mkdir -p $HOME/.config/zathura
cp --remove-destination -v $DIRDF/git/include $HOME/.gitconfig

# vim
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # vim
    cp --remove-destination -v $DIRDF/vim/source.vim $HOME/.vimrc
    cp --remove-destination -v $DIRDF/gvim/source.vim $HOME/.gvimrc

    # nvim
    # cp --remove-destination -v $DIRDF/vim/source.vim $HOME/.config/nvim
elif [[ "$OSTYPE" == "msys" ]]; then
    # vim
    cp --remove-destination -v $DIRDF/vim/source.vim $HOME/_vimrc
    cp --remove-destination -v $DIRDF/gvim/source.vim $HOME/_gvimrc

    # nvim
    mkdir -p $HOME/AppData/Local/nvim
    # cp --remove-destination -v $DIRDF/vim/source.vim $HOME/AppData/Local/nvim
fi
./vim/clone-packages.sh
