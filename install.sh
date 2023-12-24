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

echo -ne "Diretórios essenciais: "
mkdir -p $HOME/dev/desh
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
echo -e "OK"

DIRDF_FROM_HOME=dev/dotfiles # evitar $HOME no windows como /c/users/bla/
DIRDF=$HOME/$DIRDF_FROM_HOME

echo -ne "Git: "
echo "[include]
    path = $DIRDF_FROM_HOME/.gitconfig
    path = .gitconfig-local" > $HOME/.gitconfig
echo -e "OK"

echo -ne "Neovim config: "
cp $DIRDF/nvim/lua/my/env.example $DIRDF/nvim/lua/my/env.lua
echo "source ~/$DIRDF_FROM_HOME/nvim/init.lua" > $HOME/.config/nvim/init.vim
echo -e "OK"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo -ne "Bash:"
  echo ". $DIRDF/.bashrc" > $HOME/.bashrc
  echo -e "OK"

  echo -ne "Neovim packer:"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  echo -e "OK (ignore o erro \"already exists and is not an empty directory\")"
fi

echo -ne "Neovim plugins:"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo -e "OK"

echo -e "\nNotas:"
echo -e "\tNeovim 1: instalar xclip e ripgrep (rg)"
echo -e "\n"

read -p "Aperte enter para fechar"
