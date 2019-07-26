# set bg
~/.fehbg

# set status
# kill previous script if running
# same of dwm_refresh_status
pkill -f $HOME/dev/dotfiles/scripts/dwm_status.sh
~/dev/dotfiles/scripts/dwm_status.sh&

# init dwm
exec dwm

[[ -f ~/.Xdefaults ]] && xrdb ~/.Xdefaults

