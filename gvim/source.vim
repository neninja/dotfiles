source ~/dev/dotfiles/gvim/gvimrc

if filereadable(expand("~/.extra-gvimrc.vim"))
    source ~/.extra-gvimrc.vim
endif
