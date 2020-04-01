#!/bin/bash
function clonaVendorRepos {
    mkdir -p pack/vendor/start
    cd pack/vendor/start
    for i in "${vendorRepos[@]}"
    do
        git clone $i
    done
}

function clonaNeniRepos {
    mkdir -p pack/neni/start
    cd pack/neni/start
    for i in "${neniRepos[@]}"
    do
        git clone $i
    done
}

vendorRepos=(
    "https://github.com/junegunn/goyo.vim.git" # melhor visualização possível
    "https://github.com/ctrlpvim/ctrlp.vim.git" # fuzzy finder
    "https://github.com/mhinz/vim-startify.git" # tela inicial com projetos
    "https://github.com/diepm/vim-rest-console.git" # rest client
    "https://github.com/vimwiki/vimwiki.git" # todo
    "https://github.com/jiangmiao/auto-pairs.git" # funcionalidades de "'{[()]}'"
    "https://github.com/editorconfig/editorconfig-vim.git" # configurações específicas de projeto
    
    ####### Auto complete
    "https://github.com/skywind3000/vim-auto-popmenu.git" # sugestões de complete
    "https://github.com/skywind3000/vim-dict.git" # configuração de cadastro de dicionários
    
    ####### GIT
    "https://github.com/tpope/vim-fugitive.git" # comandos
    "https://github.com/airblade/vim-gitgutter.git" # exibição de + - ~ _
    "https://github.com/junegunn/gv.vim.git" # log

    ####### PHP
    "https://github.com/adoy/vim-php-refactoring-toolbox.git" # macros uteis

    ####### Desnecessários
    "https://github.com/thanthese/Tortoise-Typing.git" # treino de digitação
    "https://github.com/gyim/vim-boxdraw.git" # desenho de diagramas ascii
)

neniRepos=(
    # "https://github.com/nenitf/git-vim.git"
    # "https://github.com/nenitf/simplinter-vim.git"
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    mkdir -p ~/.vim
    cd ~/.vim
    clonaVendorRepos
    cd ~/.vim
    clonaNeniRepos
elif [[ "$OSTYPE" == "msys" ]]; then
    mkdir -p ~/vimfiles
    cd ~/vimfiles
    clonaVendorRepos
    cd ~/vimfiles
    clonaNeniRepos
fi
