" autor: felipedacs
" A partir de vim-bootstrap b0a75e4
" motivacional: https://www.youtube.com/watch?v=XA2WjJbmmoM

let mapleader="\<space>"

"*********************************************************
" Vim-PLug core
"*********************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

if filereadable(expand("~/.nvimrc.local.bundles"))
  source ~/.nvimrc.local.bundles
endif

"" Include user's extra bundle
if filereadable(expand("~/.nvimrc.local"))
  source ~/.nvimrc.local
endif
