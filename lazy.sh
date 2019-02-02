#!/usr/bin/env bash
cd ~
mkdir dev
git clonehttps://github.com/felipedacs/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
