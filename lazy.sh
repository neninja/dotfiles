#!/usr/bin/env bash
cd ~
mkdir dev
cd dev
git clone https://github.com/nenitf/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh

