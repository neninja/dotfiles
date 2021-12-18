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

mkdir -p $HOME/.config

DIRDF_FROM_HOME=dev/dotfiles # evitar $HOME no windows como /c/users/bla/
DIRDF=$HOME/$DIRDF_FROM_HOME

# git
echo "[include]
    path = $DIRDF_FROM_HOME/.gitconfig" > $HOME/.gitconfig

# vim
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # bash
    echo ". $DIRDF/.bashrc" > $HOME/.bashrc

    # vim
    echo "source ~/$DIRDF_FROM_HOME/vim/vimrc" > $HOME/.vimrc
    echo "source ~/$DIRDF_FROM_HOME/vim/gvimrc" > $HOME/.gvimrc
elif [[ "$OSTYPE" == "msys" ]]; then
    # vim
    echo "source ~/$DIRDF_FROM_HOME/vim/vimrc" > $HOME/_vimrc
    echo "source ~/$DIRDF_FROM_HOME/vim/gvimrc" > $HOME/_gvimrc
fi
./vim/clone-packages.sh
vim -c "helptags ~/$DIRDF_FROM_HOME/vim/doc" -c -q

# less command
read -p "Aperte enter para fechar"
