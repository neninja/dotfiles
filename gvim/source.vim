source ~/dev/dotfiles/gvim/gvimrc

if filereadable(expand("~/.extra-gvimrc.vim"))
    source ~/.extra-gvimrc.vim
    " Colocar font em ~/.extra-gvimrc.vim, pois varia de sistema operacional ...
    " set guifont=UbuntuMono\ NF:h11
    " set guifont=Fira\ Code:h10
    " set guifont=Consolas:h11
    " Para ver as opções de font: set guifont=*
endif
