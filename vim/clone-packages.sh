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
    "https://github.com/editorconfig/editorconfig-vim.git" # configurações específicas de projeto
    "https://github.com/unblevable/quick-scope.git" # highlight letras unicas das palavras para usar ftFT
    "https://github.com/joshdick/onedark.vim.git" # colorscheme
    "https://github.com/dense-analysis/ale.git" # lint

    ####### GIT
    "https://github.com/tpope/vim-fugitive.git" # comandos
    "https://github.com/airblade/vim-gitgutter.git" # exibição de + - ~ _
    "https://github.com/junegunn/gv.vim.git" # log

    ####### PHP
    "https://github.com/adoy/vim-php-refactoring-toolbox.git" # macros uteis

    ####### JS
    "https://github.com/pangloss/vim-javascript.git" # melhora na syntax js
    "https://github.com/MaxMEllon/vim-jsx-pretty.git" # syntax e indent jsx ts
    "https://github.com/Quramy/tsuquyomi.git" # autocomplete e lint de ts
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
