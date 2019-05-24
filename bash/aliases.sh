# Aliases
# =====================
# CD
alias d='cd ~/dev/desh; ls -alf --color; echo -e "\n-> dev trash dashboard\n-> to clean: rm -rf * .*"'
alias cphp='cd ~/dev/php'
alias cpy='cd ~/dev/python'
alias cfr='cd ~/dev/front/'
alias ctex='cd ~/dev/tex'
alias cgh='cd ~/go/src/github.com/nenitf'
alias cgl='cd ~/go/src/gitlab.com/nenitf'
alias cdfs='cd $DF/scripts ; l'
alias iss='cd ~/dev/is/tmp/suckless'
alias is='cd $IS'
alias ccv='cd ~/dev/tex/cv'
alias cv='nvim ~/dev/tex/cv/felipe_silva.tex'
alias .b='. ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# configfiles
alias cfn='nvim $DF/nvim/.nvimrc'
alias cfnp='nvim $DF/nvim/.nvimrc.plugs'
alias cfa='nvim $DF/bash/aliases.sh'
alias cfe='nvim $DF/bash/exports.sh'
alias cff='nvim $DF/bash/functions.sh'
alias isi='nvim $IS/install.sh'
alias isf='nvim $IS/functions.sh'
alias cdfi='nvim $DF/install.sh'

# GIT
alias g="git"
alias gfr='git fetch --all ; git reset --hard origin/master'
alias gop='xdg-open $(git config --get remote.origin.url)'

# LS
alias ll='ls -alF --color'
alias l='ls -XF --color'
alias lm='ls -lS --block-size=M'

# Scrot
alias sct='scrot -s -d 5 -c ~/Imagens/prints/scrot::%Y-%m-%d::%H%M%S.jpg'

# programs
alias ff='fff'
alias i='i3lock'
alias n='nvim'
alias nm='neomutt'
alias p='pandoc'
alias z='zathura'

# lazy
alias op='xdg-open .'
alias mci='sudo make clean install'
alias snc='sudo nvim config.h'
