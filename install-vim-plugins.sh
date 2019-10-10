#!/bin/bash
function clonaRepos {
    mkdir -p pack/vendor/start
    cd pack/vendor/start
    for i in "${vendorRepos[@]}"
    do
        git clone $i
    done

    mkdir -p pack/neni/start
    cd pack/neni/start
    for i in "${neniRepos[@]}"
    do
        git clone $i
    done
}

vendorRepos=(
    "https://github.com/tomtom/tlib_vim.git" # dependencia snipmate
    "https://github.com/MarcWeber/vim-addon-mw-utils.git" # dependencia snipmate
    "https://github.com/garbas/vim-snipmate.git" # engine de snippet simples
    "https://github.com/sunaku/vim-modusline.git" # exibe modo e muda a cor da status line de acordo
    "https://github.com/junegunn/goyo.vim.git" # melhor visualização possível
    "https://github.com/sheerun/vim-polyglot.git" # coletanea de syntax para muitas linguagens
    "https://github.com/ctrlpvim/ctrlp.vim.git" # fuzzy finder
    "https://github.com/mhinz/vim-startify.git" # tela inicial com projetos

    ####### PHP
    "https://github.com/adoy/vim-php-refactoring-toolbox.git"
)

neniRepos=(
    "https://github.com/nenitf/git-vim.git"
    "https://github.com/nenitf/simplinter-vim.git"
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    cd ~/.vim
    clonaRepos
elif [[ "$OSTYPE" == "msys" ]]; then
    cd ~/vimfiles
    clonaRepos
fi
