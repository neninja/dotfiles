source ~/dev/dotfiles/vim/vimrc
source ~/dev/dotfiles/vim/packages.vim

if filereadable(expand("~/.extra-vimrc.vim"))
    source ~/.extra-vimrc.vim
endif
