#!/bin/bash
function clonaRepos {
    mkdir -p pack/vendor/start
    cd pack/vendor/start
    for i in "${repos[@]}"
    do
        git clone $i
    done
}

repos=(
    "https://github.com/majutsushi/tagbar.git" # visualizador de ctags
    "https://github.com/tpope/vim-fugitive.git"
    "https://github.com/junegunn/gv.vim.git"
    "https://github.com/airblade/vim-gitgutter.git" # marcações git nos arquivos
    "https://github.com/dense-analysis/ale.git" # linter para todas linguagens
    "https://github.com/mattn/emmet-vim.git" # emmet html
    "https://github.com/chrisbra/Colorizer.git" # mostra cores css
    "https://github.com/tomtom/tlib_vim.git" # dependencia snipmate
    "https://github.com/MarcWeber/vim-addon-mw-utils.git" # dependencia snipmate
    "https://github.com/garbas/vim-snipmate.git" # engine de snippet simples
    "https://github.com/sunaku/vim-modusline.git" # exibe modo e muda a cor da status line de acordo
    "https://github.com/junegunn/goyo.vim.git" # melhor visualização possível
    "https://github.com/sheerun/vim-polyglot.git" # coletanea de syntax para muitas linguagens
    "https://github.com/ctrlpvim/ctrlp.vim.git" # fuzzy finder
    "https://github.com/cohama/agit.vim.git" # log viewer com :Agit
    "https://github.com/mhinz/vim-startify.git" # tela inicial com projetos
    "https://github.com/lambdalisue/gina.vim.git"
    "https://github.com/neoclide/vim-easygit.git"
    "https://github.com/rhysd/git-messenger.vim.git" # visualiza msg de commit da linha com :GitMessenger
    #"https://github.com/juneedahamed/vc.vim.git"
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    cd ~/.vim
    clonaRepos
elif [[ "$OSTYPE" == "msys" ]]; then
    cd ~/vimfiles
    clonaRepos
fi
