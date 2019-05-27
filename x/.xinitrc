# set bg
~/.fehbg

# set status
# kill previous script if running
pkill -f $DF/scripts/dwm/status.sh
~/dev/dotfiles/scripts/dwm/status.sh&

# init dwm
exec dwm

[[ -f ~/.Xdefaults ]] && xrdb ~/.Xdefaults

