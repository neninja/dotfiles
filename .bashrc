test -f ~/.bashrc-local.sh && . ~/.bashrc-local.sh
#{{{ Prompt String

# https://ss64.com/bash/syntax-prompt.html

# Heavily inspired by @necolas’s prompt:
#   https://github.com/necolas/dotfiles

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color';
fi;

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
BFG_RESET_ALL="\[\e[0m\]"

# FG USADO PARA COLORIR FUNDO DA  OU TEXTO
BG_DEFAULT="\[\e[49m\]"
BG_BLACK="\[\e[40m\]"
BG_WHITE="\[\e[107m\]"
BG_RED="\[\e[41m\]"
BG_RED_LIGHT="\[\e[101m\]"
BG_GREEN="\[\e[42m\]"
BG_GREEN_LIGHT="\[\e[102m\]"
BG_YELLOW="\[\e[43m\]"
BG_YELLOW_LIGHT="\[\e[103m\]"
BG_BLUE="\[\e[44m\]"
BG_BLUE_LIGHT="\[\e[104m\]"
BG_MAGENTA="\[\e[45m\]"
BG_MAGENTA_LIGHT="\[\e[105m\]"
BG_CYAN="\[\e[46m\]"
BG_CYAN_LIGHT="\[\e[106m\]"
BG_GRAY_LIGHT="\[\e[47m\]"
BG_GRAY_DARK="\[\e[100m\]"

# FG USADO PARA COLORIR  OU TEXTO
FG_BLINK="\[\e[5m\]"
FG_BOLD="\[\e[1m\]"
FG_DIM="\[\e[2m\]"
FG_UNDERLINE="\[\e[4m\]"

FG_DEFAULT="\[\e[39m\]"
FG_BLACK="\[\e[30m\]"
FG_WHITE="\[\e[97m\]"
FG_RED="\[\e[31m\]"
FG_RED_LIGHT="\[\e[91m\]"
FG_GREEN="\[\e[32m\]"
FG_GREEN_LIGHT="\[\e[92m\]"
FG_YELLOW="\[\e[33m\]"
FG_YELLOW_LIGHT="\[\e[93m\]"
FG_BLUE="\[\e[34m\]"
FG_BLUE_LIGHT="\[\e[94m\]"
FG_MAGENTA="\[\e[35m\]"
FG_MAGENTA_LIGHT="\[\e[95m\]"
FG_CYAN="\[\e[36m\]"
FG_CYAN_LIGHT="\[\e[96m\]"
FG_GRAY_LIGHT="\[\e[37m\]"
FG_GRAY_DARK="\[\e[90m\]"

TEST_COLORS_PROMPT="$(for i in {40..47} {100..107} {30..37} {90..97} ; do echo -en "\e[${i}m # \e[0m" ; done ; echo)"

prompt_git() {
  local s='';
  local branchName='';

  # Check if the current directory is in a Git repository.
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then
      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null;

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then s+='+'; fi;

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then s+='!'; fi;

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then s+='?'; fi;

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then s+='$'; fi;
    fi;

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                git rev-parse --short HEAD 2> /dev/null || \
                echo '(unknown)')";

    [ -n "${s}" ] && s=" [${s}]";

    echo -e " ${1}${branchName}${s}";
  else
    return;
  fi;
}

ps1_simple(){
  # Como PS é modificado através de função
  # para evitar duplicação ele precisa ser inicializado.
  # A melhor forma é no início pois evita que seja dentro de if
  PS1=""
  PS2=""

  # Highlight the user name when logged in as root.
  if [[ "${USER}" == "root" ]]; then
    userStyle="$FG_RED";
  else
    userStyle="$FG_CYAN";
  fi;

  # Highlight the hostname when connected via SSH.
  if [[ "${SSH_TTY}" ]]; then
    hostStyle="$BG_BOLD$FG_RED";
  else
    hostStyle="$FG_YELLOW";
  fi;

  PS1+="$BG_DEFAULT$FG_CYAN["
  PS1+="$FG_BLUE_LIGHT\u"
  #PS1+="@"
  #PS1+="\h"
  PS1+="$FG_CYAN]"

  PS1+="$BG_DEFAULT$FG_BLUE_LIGHT["
  PS1+="$BG_DEFAULT$FG_MAGENTA_LIGHT"
  PS1+='$(echo $(dirname $(echo \w | sed "s;$HOME;~;"))/ |sed -e "s;\(/\.\?.\)[^/]*;\1;g" -e "s;/h/s;~;" -e "s;\./;;")\W'
  PS1+="$BG_DEFAULT$FG_BLUE_LIGHT]"

  if [ ! -w "$PWD" ]; then
    # Current directory is not writable
    PS1+="$BG_DEFAULT$FG_GRAY_DARK "
  fi

  PS1+="$BG_DEFAULT$FG_YELLOW$(prompt_git)$BG_DEFAULT"; # Git repository details

  PS1+="$BG_DEFAULT$FG_WHITE \$ $BFG_RESET_ALL";
  PS1+="$BFG_RESET_ALL"; # reset bg and fg colors
  export PS1;

  PS2="$BG_DEFAULT$FG_YELLOW→ ";
  PS2+="$BFG_RESET_ALL"; # reset bg and fg colors
  export PS2;
}

PROMPT_COMMAND="ps1_simple; $PROMPT_COMMAND"

#}}}
#{{{ Aliases
alias c="clear"
alias m="make -f meumakefile"
alias g="git"
alias xcb='tr -d "\n" | xclip -selection clipboard'
alias pwdx='pwd | tr -d "\n" | xclip -selection clipboard'
alias op='xdg-open .'
alias anbox='anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity' # adb install ~/path/to/app.apk
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dca="docker-compose exec app"
#{{{ CD
alias cdf="cd $HOME/dev/dotfiles"
alias cdev="cd $HOME/dev"
alias cdphp="cd $HOME/dev/php"
alias d='cd ~/dev/desh; ls -alf --color; echo -e "\n-> dev trash dashboard\n-> to clean: rm -rf * .*"'
alias .b='. ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
#}}}
#{{{ LS
alias ll='ls -alF --color'
alias l='ls -aXF --color'
alias lm='ls -alS --block-size=M'
#}}}
#{{{ PHP
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias s='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias sa='[ -f sail ] && bash sail || bash vendor/bin/sail art'
alias sc='[ -f sail ] && bash sail || bash vendor/bin/sail composer'
alias sup='[ -f sail ] && bash sail || bash vendor/bin/sail up -d'
alias sd='[ -f sail ] && bash sail || bash vendor/bin/sail down'
alias sam='[ -f sail ] && bash sail || bash vendor/bin/sail artisan migrate:fresh --seed'
alias sao='[ -f sail ] && bash sail || bash vendor/bin/sail artisan optimize:clear'
alias saq='[ -f sail ] && bash sail || bash vendor/bin/sail composer art queue:work'
alias sci='[ -f sail ] && bash sail || bash vendor/bin/sail composer ide'
alias sp='[ -f sail ] && bash sail || bash vendor/bin/sail php'
alias spp='[ -f sail ] && bash sail || bash vendor/bin/sail php ./vendor/bin/pint'
alias sppd='[ -f sail ] && bash sail || bash vendor/bin/sail php ./vendor/bin/pint --dirty'
alias sn='[ -f sail ] && bash sail || bash vendor/bin/sail npm'
alias tdd='gon -c '
alias tdds='gon -c ./vendor/bin/sail test '
alias tddsf='gon -c ./vendor/bin/sail test --filter '
#}}}
#{{{ Vim
alias n="nvim"
alias v="vim"
#}}}
#}}}
#{{{ Functions
# DESC: Ver previsão do tempo para Porto Alegre
# USE: wttr
wttr(){
    curl wttr.in/porto+alegre?lang=pt-br
}

# DESC: Repetir um mesmo comando com Enter
# USE: wrl echo "a"
wrl(){
	while $@; read line; do true; done;

  # simplificação
  # $@;
  # while read line; do $@; done;
}

# DESC: Simplificar comando de execução imnline do Laravel Tinker
# USE: tinker "Storage::put(time().'.txt', 'hello')"
tinker(){
	sail art tinker --execute="$@"
}

# DESC: Repetir X vezes o comando Y
# USE: fori 10 echo "olha"
fori(){
    local FORI1=$1
    shift 1

    for i in $(seq 1 $FORI1); do
        $@
    done;
}

# DESC: Criar e entrar na pasta
# USE: mk folder
mk(){
    mkdir $1;
    cd $1;
}

# DESC: Arquivos basicos dos meus repositórios com git
# USE: gi
gi(){
    cp ~/dev/dotfiles/modelos/git/UNLICENSE UNLICENSE;
    cp ~/dev/dotfiles/modelos/git/CONTRIBUTING.md CONTRIBUTING.md;
    (echo -n '# '; pwd | rev | cut -d '/' -f1 | rev) >> README.md;
    echo -e "\n-> don't forget to use git init or git flow init and create branch master";
}

# DESC: Extração de arquivos
# USE: extract imazip.zip
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)
                tar xjf $1
                ;;
            *.tar.gz)
                tar xzf $1
                ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.rar)
                rar x $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.tar)
                tar xf $1
                ;;
            *.tbz2)
                tar xjf $1
                ;;
            *.tgz)
                tar xzf $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *)
                echo "'$1' cannot be extracted via extract()"
                ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#{{{ Pendrives
# DESC: Formatar pendrive
# USE: fmtpendrive sdb1
fmtpendrive(){
    # identificar pendrive: sudo fdisk -l
    sudo mkfs.vfat -I /dev/$1
}
#}}}

#{{{
# DESC: exibir um gopherzinho
# USE: gopher
# USE: gopher vampire
gopher(){
  pink=`tput setaf 213`
  cyan=`tput setaf 14`
  beige=`tput setaf 215`
  white=`tput setaf 15`
  black=`tput setaf 0`
  red=`tput setaf 9`
  base=$cyan
  reset=`tput sgr0`
  eye=" ^   "
  teeth="${white}UU"
  if [[ "$1" == "vampire" ]]
  then
    eye="  o  "
    teeth="${red}VV"
  fi
  echo "${base}      ´.-::::::-.´"
  echo "${base}  .:-::::::::::::::-:."
  echo "${base}  ´_::${white}:    ::    :${base}::_´"
  echo "${base}   .:${white}(${eye}::${eye})${base}:."
  echo "${base}   ´::${white}:   ${beige}(${black}..${beige})${white}   :${base}::."
  echo "${base}   ´:::::::${teeth}${base}:::::::´"
  echo "${base}   .::::::::::::::::."
  echo "${beige}   O${base}::::::::::::::::${beige}O"
  echo "${base}   -::::::::::::::::-"
  echo "${base}   ´::::::::::::::::´"
  echo "${base}    .::::::::::::::."
  echo "${beige}      oO${base}:::::::${beige}Oo"
  echo "${reset}"
}
#}}}
#}}}
#{{{ Exports
export GOPATH=$HOME/go

# export VISUAL=nvim
export VISUAL=vim
export EDITOR=$VISUAL

export DF=$HOME/dev/dotfiles
export IS=$HOME/dev/is

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/Android/Sdk:/usr/local/go/bin:$GOPATH/bin:$PATH;
#}}}
#{{{ Inputrc
# Desabilitar case-sensitive
set completion-ignore-case on

# Mostrar possíveis complementações
set show-all-if-ambiguous on
#}}}

# vim:fdm=marker:
