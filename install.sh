#!/usr/bin/env bash
#
# Esse sript copia arquivos de configuração (dotfiles) selecionados para linux
# e windows.
#
# AUTHOR: Neni @nenitf <http://neni.dev>
# SOURCE: https://raw.githubusercontent.com/nenitf/dotfiles/install.sh
#
# Agradecimentos:
#   - @gbencke durante o meetup de python em 2018 onde explicou as vantagens da
#   portabilidade dos dotfiles (e do vim)
#   - Luke <http://lukesmith.xyz> por disponibilizar ótimo conteúdo sobre Linux
#
# ----------------------------------- MAIN -------------------------------------
mkdir -p ~/dev/desh
mkdir -p ~/.config/nvim

mkdir -p $HOME/.config

DIRDF_FROM_HOME=dev/dotfiles # evitar $HOME no windows como /c/users/bla/
DIRDF=$HOME/$DIRDF_FROM_HOME

# git
echo "[include]
    path = $DIRDF_FROM_HOME/.gitconfig
    path = .gitconfig-extra" > $HOME/.gitconfig

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # bash
    echo ". $DIRDF/.bashrc" > $HOME/.bashrc
fi

# nvim
echo "source ~/$DIRDF_FROM_HOME/vim/dotfiles.vim" > $HOME/.config/nvim

# less command
read -p "Aperte enter para fechar"
