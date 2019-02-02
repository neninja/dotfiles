#!/usr/bin/env bash
#
# install.sh - Padrão de instalação inicial no linux
#
# Site:             dacs.run/dotfiles
# Autor/Mantenedor: Felipe Silva - github.com/felipedacs
# ---------------------------------------------------------- #
# Esse sript instala pacotes, programas, temas e arquivos de
# configuração selecionados para linux conforme o cenário
# escolhido na interface gráfica.
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
# ------------------------- FUNÇÕES ------------------------ #
linkandoDotfiles(){
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install -all
    ln -v -s -f $(pwd)/.fzf.bash $HOME/.fzf.bash

    ln -v -s -f $(pwd)/.bashrc $HOME/.bashrc
    ln -v -s -f $(pwd)/.inputrc $HOME/.inputrc
    ln -v -s -f $(pwd)/.bash_profile $HOME/.bash_profile
    ln -v -s -f $(pwd)/.bash_prompt $HOME/.bash_prompt
    ln -v -s -f $(pwd)/.exports $HOME/.exports
    ln -v -s -f $(pwd)/.functions $HOME/.functions
    ln -v -s -f $(pwd)/.aliases $HOME/.aliases
    ln -v -s -f $(pwd)/.scripts $HOME/.scripts

    ln -v -s -f $(pwd)/.gitconfig $HOME/.gitconfig

    ln -v -s -f $(pwd)/.vimrc $HOME/.vimrc
    ln -v -s -f $(pwd)/.vim/dacs-snippets $HOME/.vim

    # existe a pasta doc?
    [ -d "$HOME/.vim/doc" ] && rm -r $HOME/.vim/doc
    informaAcaoCenario "CONFIGURANDO HELP VIM"
    ln -v -s -f $(pwd)/.vim/doc $HOME/.vim/doc
}

linkandoDotfiles
