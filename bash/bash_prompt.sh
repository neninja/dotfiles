#!/usr/bin/env bash

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

            echo -e " ${1} ${branchName}${s} ";
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

    PS1+="$BG_DEFAULT$FG_YELLOW[\W]"; # working directory, pwd command show full path
    PS1+="$BG_RED$FG_WHITE$(prompt_git )"; # Git repository details

    if [ ! -w "$PWD" ]; then
        # Current directory is not writable
        PS1+="$BG_YELLOW_LIGHT$FG_GRAY_DARK  "
    fi

    PS1+="$BG_DEFAULT$FG_WHITE \$ $BFG_RESET_ALL";
    PS1+="$BFG_RESET_ALL"; # reset bg and fg colors
    export PS1;

    PS2="$BG_DEFAULT$FG_YELLOW→ ";
    PS2+="$BFG_RESET_ALL"; # reset bg and fg colors
    export PS2;
}

# Heavily inspired by @abhijitvalluri simple power line:
#   https://github.com/abhijitvalluri/bash-powerline-shell
ps1_simple_powerline(){
    # Como PS é modificado através de função
    # para evitar duplicação ele precisa ser inicializado.
    # A melhor forma é no início pois evita que seja dentro de if
    PS1=""
    PS2=""

    # Quando for colorir  atente-se que a cor:
    #   deve ser a mesma que o background do texto anterior
    #   deve ser a mesma que o background da 
    #PS1="$BG_GRAY$FG_GRAY$BG_GRAY$FG_GRAY_LIGHT \$ $BG_GREEN$FG_GRAY"
    #      -------         --------                            -------

    local NF_PWD=$(pwd | awk -F/ '{print NF-1}')
    # number of total of directories in pwd
    # example: /home/user/dev/javascript -> NF_PWD = 4

    local DEV_DIR_PWD=$(pwd | awk -F/ '{print "/"$2"/"$3"/"$4"/"$5}')
    if [ "$DEV_DIR_PWD" = "$HOME/dev/front" ]; then 
        PS1+="$BG_YELLOW$FG_BLACK$FG_BOLD$FG_BLINK  $BFG_RESET_ALL"
    fi
    if [ "$DEV_DIR_PWD" = "$HOME/dev/python" ]; then
        PS1+="$BG_YELLOW$FG_BLACK$FG_BOLD$FG_BLINK  $BFG_RESET_ALL"
    fi
    if [ "$DEV_DIR_PWD" = "$HOME/go/src" ]; then
        PS1+="$BG_BLUE_LIGHT$FG_BLACK$FG_BOLD$FG_BLINK  $BFG_RESET_ALL"
    fi
    if [ "$DEV_DIR_PWD" = "$HOME/dev/php" ]; then
        PS1+="$BG_BLUE_LIGHT$FG_BLACK$FG_BOLD$FG_BLINK  $BFG_RESET_ALL";
    fi
    if [ "$DEV_DIR_PWD" = "$HOME/dev/desh" ]; then
        PS1+="$BG_GREEN$FG_BLACK$FG_BOLD$FG_BLINK ☢ $BFG_RESET_ALL";
    fi


    # here's a simple trick
    #   if pwd is /home/user/dev/javascript
    #       echo ${PWD%/*/*} will show less 2 directories in <- direction
    #           /home/user/dev
    #       echo ${PWD#"/home"} will show less 1 directory in -> direction
    #           /user/dev/dev/javascript
    #       echo ${PWD#"${PWD%/*/*}"} will cut /home/user of pwd
    #           /dev/javascript
    # www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt
    local PARENT_DIR_PWD=$(echo ${PWD#"${PWD%/*/*}"} | awk -F/ '{print $2}')
    local CURRENT_DIR_PWD=$(echo ${PWD#"${PWD%/*}"} | awk -F/ '{print $2}')
    if [ "$PARENT_DIR_PWD" = "" ] && ! [ "$CURRENT_DIR_PWD" = "" ] ; then
        PS1+="$BG_BLUE_LIGHT$FG_WHITE / "
        PS1+="$BG_BLUE$FG_BLUE_LIGHT"
    elif ! [ "$PARENT_DIR_PWD" = "" ]; then
        PS1+="$BG_BLUE$FG_WHITE $PARENT_DIR_PWD "
        PS1+="$BG_BLUE$FG_BLACK"
    fi
    if [ "$CURRENT_DIR_PWD" = "" ]; then
    #PS1+="$BG_BLUE$FG_GRAY_LIGHT $CURRENT_DIR_PWD "
    PS1+="$BG_BLUE$FG_GRAY_LIGHT \W "
    else
    PS1+="$BG_BLUE$FG_GRAY_LIGHT $CURRENT_DIR_PWD "
    #PS1+="$BG_BLUE$FG_GRAY_LIGHT \W "
    fi

    PS1+="$BG_RED$FG_WHITE\$(prompt_git )"; # Git repository details

    if [ ! -w "$PWD" ]; then
        # Current directory is not writable
        PS1+="$BG_YELLOW$FG_BLACK  "
    fi

    PS1+="$BG_GRAY_DARK$FG_GRAY_LIGHT \$ "
    PS1+="$BFG_RESET_ALL$FG_GRAY_DARK"
    PS1+="$BFG_RESET_ALL "
    export PS1;

    PS2+="$BG_GRAY_DARK$FG_GRAY_LIGHT + "
    PS2+="$BFG_RESET_ALL$FG_GRAY_DARK"
    PS2+="$BFG_RESET_ALL "
    export PS2;
}

#PROMPT_COMMAND="ps1_simple; $PROMPT_COMMAND"
PROMPT_COMMAND="ps1_simple_powerline; $PROMPT_COMMAND"
