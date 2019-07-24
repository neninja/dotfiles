# Aliases
# =====================
# CD
alias d='cd ~/dev/desh; ls -alf --color; echo -e "\n-> dev trash dashboard\n-> to clean: rm -rf * .*"'
alias cgh='cd ~/go/src/github.com/nenitf'
alias cgl='cd ~/go/src/gitlab.com/nenitf'
alias iss='cd ~/dev/is/tmp/suckless'
alias is='cd $IS'
alias .b='. ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# GIT
alias g="git"
alias gfr='git fetch --all ; git reset --hard origin/master'
alias gop='xdg-open $(git config --get remote.origin.url)'

# LS
alias ll='ls -alF --color'
alias l='ls -XF --color'
alias lm='ls -lS --block-size=M'

# programs
alias ff='fff'
alias nm='neomutt'
alias p='pandoc'
alias z='zathura'
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias xcb='tr -d "\n" | xclip -selection clipboard'

# lazy
alias op='xdg-open .'
alias mci='sudo make clean install'
alias snc='sudo nvim config.h'

# scripts
alias nn="bash $HOME/dev/dotfiles/scripts/ninjanotes.sh"
