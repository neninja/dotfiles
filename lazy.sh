#!/usr/bin/env bash
cd ~
mkdir dev
cd dev
git clone https://github.com/ceife/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
