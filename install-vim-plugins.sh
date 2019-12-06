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
    "https://github.com/sunaku/vim-modusline.git" # exibe modo e muda a cor da status line de acordo
    "https://github.com/junegunn/goyo.vim.git" # melhor visualização possível
    #"https://github.com/sheerun/vim-polyglot.git" # coletanea de syntax para muitas linguagens
    "https://github.com/ctrlpvim/ctrlp.vim.git" # fuzzy finder
    "https://github.com/mhinz/vim-startify.git" # tela inicial com projetos
    "https://github.com/drmingdrmer/xptemplate.git" # snippets
    "https://github.com/diepm/vim-rest-console.git" # rest client
    "https://github.com/vimwiki/vimwiki.git" #todo

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
