# Aliases
# =====================
# CD
alias d='cd ~/dev/desh; ls -alf --color; echo -e "\n-> dev trash dashboard\n-> to clean: rm -rf * .*"'
alias cgh='cd ~/go/src/github.com/nenitf'
alias cgl='cd ~/go/src/gitlab.com/nenitf'
alias iss='cd ~/dev/is/tmp/suckless'
alias .b='. ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# LS
alias ll='ls -alF --color'
alias l='ls -XF --color'
alias lm='ls -lS --block-size=M'

# programs
alias ff='fff'
alias g="git"
alias nm='neomutt'
alias p='pandoc'
alias z='zathura'
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias xcb='tr -d "\n" | xclip -selection clipboard'
alias pwdx='pwd | tr -d "\n" | xclip -selection clipboard'

# lazy
alias op='xdg-open .'
alias mci='sudo make clean install'
alias snc='sudo $EDITOR config.h'

# scripts
alias nn="bash ~/dev/dotfiles/scripts/ninjanotes.sh"

# VAGRANT
alias vg='vagrant'
#alias vgh="vagrant ssh";
alias vgh="vagrant halt";
alias vgr="vagrant reload";
alias vgs="vagrant global-status";
alias vgu="vagrant up";