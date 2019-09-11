DEL %userprofile%\.gitconfig
DEL %userprofile%\.bash_profile
DEL %userprofile%\_vimrc
DEL %userprofile%\_gvimrc

MKLINK /h %userprofile%\.gitconfig %userprofile%\dev\dotfiles\git\.gitconfig
MKLINK /h %userprofile%\.bash_profile %userprofile%\dev\dotfiles\bash\.bash_profile
MKLINK /h %userprofile%\_vimrc %userprofile%\dev\dotfiles\vim\vimrc
MKLINK /h %userprofile%\_gvimrc %userprofile%\dev\dotfiles\vim\gvimrc

PAUSE