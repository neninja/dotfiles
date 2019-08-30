DEL %userprofile%\.gitconfig
DEL %userprofile%\.bash_profile
DEL %userprofile%\_vimrc

MKLINK /h %userprofile%\.gitconfig %userprofile%\dev\dotfiles\git\.gitconfig
MKLINK /h %userprofile%\.bash_profile %userprofile%\dev\dotfiles\bash\.bash_profile
MKLINK /h %userprofile%\_vimrc %userprofile%\dev\dotfiles\vim\_vimrc

PAUSE