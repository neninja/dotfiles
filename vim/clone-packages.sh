#!/bin/bash
function clonaVendorRepos {
    mkdir -p pack/vendor/start
    mkdir -p pack/vendor/opt

    cd pack/vendor/start
    for i in "${vendorStartRepos[@]}"
    do
        git clone $i
    done

    cd ../opt
    for i in "${vendorOptRepos[@]}"
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

vendorStartRepos=(
    "https://github.com/junegunn/goyo.vim.git" # melhor visualização possível
    "https://github.com/mhinz/vim-startify.git" # tela inicial com projetos
    "https://github.com/diepm/vim-rest-console.git" # rest client
    "https://github.com/editorconfig/editorconfig-vim.git" # configurações específicas de projeto
    "https://github.com/unblevable/quick-scope.git" # highlight letras unicas das palavras para usar ftFT

    "https://github.com/ctrlpvim/ctrlp.vim.git" # fuzzy finder
    "https://github.com/mhinz/vim-grepper" # fuzzy finder com Ag :GrepperArg

    ####### GIT
    "https://github.com/tpope/vim-fugitive.git" # comandos
    "https://github.com/junegunn/gv.vim.git" # log

    ####### JS
    "https://github.com/pangloss/vim-javascript.git" # melhora na syntax js
    "https://github.com/MaxMEllon/vim-jsx-pretty.git" # syntax e indent jsx ts
    "https://github.com/posva/vim-vue" # vue

    ####### TS
    "https://github.com/leafgarland/typescript-vim"
    "https://github.com/peitalin/vim-jsx-typescript"

    ####### PHP
    "https://github.com/alvan/vim-php-manual.git" # manual do php no vim
    "https://github.com/phpactor/phpactor.git" # autocomplete e tools para php

    ###### HIGHLIGHT
    "https://github.com/plasticboy/vim-markdown.git"
)

vendorOptRepos=(
    #"https://github.com/vim-vdebug/vdebug.git" # XDebug
)

neniRepos=(
    # "https://github.com/nenitf/git-vim.git"
    # "https://github.com/nenitf/simplinter-vim.git"
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # vim
    mkdir -p ~/.vim
    cd ~/.vim
    clonaVendorRepos
    cd ~/.vim
    clonaNeniRepos

    # nvim
    # mkdir -p ~/.config/nvim/
    # cd ~/.config/nvim
    # clonaVendorRepos
    # cd ~/.config/nvim
    # clonaNeniRepos
elif [[ "$OSTYPE" == "msys" ]]; then
    # vim
    mkdir -p ~/vimfiles
    cd ~/vimfiles
    clonaVendorRepos
    cd ~/vimfiles
    clonaNeniRepos

    # nvim
    # mkdir -p ~/AppData/Local/nvim
    # cd ~/AppData/Local/nvim
    # clonaVendorRepos
    # cd ~/AppData/Local/nvim
    # clonaNeniRepos
fi

echo "Notas:"
echo -e "\tCaso queira utilizar ctags, baixe o binario universal-ctags: https://github.com/universal-ctags/ctags"
echo -e "\tPara utilizar autocomplete do PHP acesse a pasta para onde o phpactor foi clonado (~/.vim-ou-vimfiles/pack/vendor/start/phpactor) e baixe as dependencias com Composer"
