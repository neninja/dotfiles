#!/bin/bash
# declare an array called array and define 3 vales
repos=(
    "https://github.com/majutsushi/tagbar.git"
    "https://github.com/tpope/vim-fugitive.git"
    "https://github.com/junegunn/gv.vim.git"
    "https://github.com/airblade/vim-gitgutter.git"
    "https://github.com/dense-analysis/ale.git"
    "https://github.com/mattn/emmet-vim.git"
    "https://github.com/chrisbra/Colorizer.git"
    "https://github.com/MarcWeber/vim-addon-mw-utils.git"
    "https://github.com/garbas/vim-snipmate.git"
    "https://github.com/sunaku/vim-modusline.git"
    "https://github.com/junegunn/goyo.vim.git"
    "https://github.com/sheerun/vim-polyglot.git"
    "https://github.com/ctrlpvim/ctrlp.vim.git"
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    clonaRepos "~/.vim"
elif [[ "$OSTYPE" == "msys" ]]; then
    clonaRepos "~/vimfiles"
fi

function clonaRespos {
    cd 
    for i in "${repos[@]}"
    do

        git clone $i $1
    done
}