test -f ~/.extra-bashrc.sh && . ~/.extra-bashrc.sh
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
#{{{ CD
alias cdf="cd $HOME/dev/dotfiles"
alias d='cd ~/dev/desh; ls -alf --color; echo -e "\n-> dev trash dashboard\n-> to clean: rm -rf * .*"'
alias cgh='cd ~/go/src/github.com/nenitf'
alias cgl='cd ~/go/src/gitlab.com/nenitf'
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
#{{{ programs
alias ff='fff'
alias g="git"
alias nm='neomutt'
alias p='pandoc'
alias v='vim'
alias z='zathura'
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias dc='sudo docker-compose'
alias xcb='tr -d "\n" | xclip -selection clipboard'
alias pwdx='pwd | tr -d "\n" | xclip -selection clipboard'
#}}}
#{{{ lazy
alias op='xdg-open .'
alias mci='sudo make clean install'
alias snc='sudo $EDITOR config.h'
#}}}
#{{{ VAGRANT
alias vg='vagrant'
#alias vgh="vagrant ssh";
alias vgh="vagrant halt";
alias vgr="vagrant reload";
alias vgs="vagrant global-status";
alias vgu="vagrant up";
#}}}
#}}}
#{{{ Functions
# DESC: Ver previsão do tempo para Porto Alegre
# USE: wttr
wttr(){
    curl wttr.in/porto+alegre?lang=pt-br
}

# DESC: bin npm
# USE: nb cypress open
nb(){
    ./node_modules/.bin/$@
    #$(npm bin)/$@
}

# DESC: Abrir com nvim explorador de arquivos ou o arquivo
# USE: n
# USE: n .
# USE: n folder
# USE: n file.txt
n(){
    if [ ! -z $1 ]; then
        if [ -d $1 ] && [ ! -z $1 ]; then
            cd $1
            nvim -c ":Defx" 
        else
            nvim $1
        fi
    else
        nvim -c ":Defx" 
    fi
}

# DESC: Abrir folder com feh em tamanho centralizado
# USE: f
# USE: f image.jpg
f(){
    feh -q -. $1
}

# DESC: Servidor php
# USE: phps 8080
# USE: phps 8080 -t public
phps(){
    php -S localhost:$@
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
    cp ~/dev/dotfiles/cpfiles/git/UNLICENSE UNLICENSE;
    (echo -n '# '; pwd | rev | cut -d '/' -f1 | rev) >> README.md;
    cp ~/dev/dotfiles/cpfiles/git/.gitignore .gitignore;
    echo -e "\n-> don't forget to use git init or git flow init and create branch master";
}

# DESC: Copiar classe de apresentações do latex para uso
# USE: slides
slides(){
    cp ~/dev/dotfiles/cpfiles/latex/slides.cls slides.cls;
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

#{{{ VOLUME E BRILHO 
# DESC: Variar volume
# USE: setvol 20
setvol(){
    amixer -q -D pulse sset Master $1%
}

# DESC: Variar brilho
# USE: setbri 50
setbri(){
    # http://sandipbgt.com/2015/10/01/control-screen-brightness-from-commandline-in-ubuntu
    local MONITOR_NAME=$(xrandr | grep " connected" | cut -f1 -d " ")
    local percent_calc=$(echo "scale=2; $1/100" | bc -l)
    # http://sandipbgt.com/2015/10/01/control-screen-brightness-from-commandline-in-ubuntu
    xrandr --output $MONITOR_NAME --brightness $percent_calc
}
#}}}
#{{{ PENDRIVES
# DESC: Formatar pendrive
# USE: fmtpendrive sdb1
fmtpendrive(){
    # identificar pendrive: sudo fdisk -l
    sudo mkfs.vfat -I /dev/$1
}
#}}}
#{{{ FFMPEG
# DESC: Gravar tela (metade-esquerda ou tamanho especificado)
# USE: ffmpegs 1366x768
ffmpegs(){
    mkdir -p ~/Vídeos/ffmpeg

    # https://ffmpeg.org/ffmpeg-all.html
    # https://ffmpeg.org/ffmpeg-devices.html#x11grab
    # screen dimension with xdpyinfo
    local NOME_VID=$(echo "ffmpeg-$(date -d now "+%Y-%m-%d--%Hh-%Mm-%Ss").mp4")
    if [ ! -z $1 ]; then
        ffmpeg -f x11grab -s $1 -i :0.0 ~/Vídeos/ffmpeg/$NOME_VID
    else
        ffmpeg -f x11grab -s 1366x768 -i :0.0 ~/Vídeos/ffmpeg/$NOME_VID
    fi
}

# DESC: Dobrar velocidade de um vídeo
# USE: ffmpeg2 input
ffmpeg2(){
    # https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
    local NOME_VID=$(echo "ffmpeg-accelerated-$(date -d now "+%Y-%m-%d--%Hh-%Mm-%Ss").mp4")
    ffmpeg -i $1.mp4 -filter:v "setpts=0.5*PTS" $NOME_VID
}

# DESC: Cortar vídeo
# USE: ffmpegcut 00:00:15.0 00:00:5.0 video
#   ffmpegcut <a-partir-de> <manter-no decorrer-de> <video-mp4>
ffmpegcut(){
    local NOME_VID=$(echo "ffmpeg-cutted-$(date -d now "+%Y-%m-%d--%Hh-%Mm-%Ss").mp4")
    ffmpeg -ss $1 -i $3.mp4 -t $2 $NOME_VID
}

# DESC: Compatibilizar vídeos para o whatsapp
# USE: ffmpegwp broken working
ffmpegwp(){
    # Videos gravados com ffmpeg para wpp
    # https://stackoverflow.com/questions/39887869/ffmpeg-whatsapp-video-format-not-supported
    local NOME_VID=$(echo "ffmpeg-wp-$(date -d now "+%Y-%m-%d--%Hh-%Mm-%Ss").mp4")
    ffmpeg -i $1.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p $NOME_VID
}

# DESC: Converter vídeo em gif
# USE: ffmpeg2 10 18 input.mp4 output
# 		ffmpeg2 <inicio-do-corte> <duração-do-corte> <arquivo-video> <arquivo-gif>
# THANKS: https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/
ffmpeggif(){
    ffmpeg -ss $1 -t $2 -i $3 -f gif $4.gif
}

# DESC: Converter vídeo em gif com maior qualidade
# USE: ffmpeg2 10 18 input.mp4 output
# 		ffmpeg2 <inicio-do-corte> <duração-do-corte> <arquivo-video> <arquivo-gif>
# THANKS: https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/
ffmpeggif2(){
    ffmpeg -ss $1 -t $2 -i $3  -filter_complex "[0:v] palettegen" palette.png
    ffmpeg -ss $1 -t $2 -i $3 -i palette.png -filter_complex "[0:v][1:v] paletteuse" $4.gif
}
#}}}
#{{{ IMAGEMAGICK
# DESC: Capturar tela
# USE: sc
sc(){
    mkdir -p ~/Imagens/Screenshots
    local NOME_IMG=$(echo "screenshot-$(date -d now "+%Y-%m-%d--%Hh-%Mm-%Ss")")
    import ~/Imagens/Screenshots/$NOME_IMG.jpg
}
#}}}
#}}}
#{{{ exportorts
export GOPATH=$HOME/go
PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export VISUAL=vim
export EDITOR=$VISUAL

export DF=$HOME/dev/dotfiles
export IS=$HOME/dev/is

export PATH="$HOME/dev/dotfiles/scripts/bin:$HOME/bin:/usr/local/go/bin:$GOPATH/bin:$PATH";
#}}}
#{{{ Inputrc
# Desabilitar case-sensitive
set completion-ignore-case on

# Mostrar possíveis complementações
set show-all-if-ambiguous on

# escolher possíveis complementações já listadas
"\t": menu-complete
#}}}
