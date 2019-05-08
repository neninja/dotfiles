# Functions
# =====================
# USE: phps 8080
phps(){
    php -S localhost:$1
}

# USE: mk folder
mk(){
    mkdir $1;
    cd $1;
}

# base of repository
# USE: gi
gi(){
    cp ~/dev/dotfiles/cpfiles/UNLICENSE UNLICENSE;
    (echo -n '# '; pwd | rev | cut -d '/' -f1 | rev)>README.md;
    cp ~/dev/dotfiles/cpfiles/.gitignore .gitignore;
    echo -e "\n-> don\'t forget to use git init or git flow init and create branch master";
}

# USE: extract imazip.zip
extract () {
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

# USE: setvol 20
setvol(){
    # $1 - lvl 0 at 100
    amixer -q -D pulse sset Master $1%
}

# USE: monitors
# http://sandipbgt.com/2015/10/01/control-screen-brightness-from-commandline-in-ubuntu
monitors(){
    #xrandr | grep " connected" | cut -f1 -d " "
    xrandr | grep " connected" | cut -f1 -d " "
}

# USE: brightness monitor-name 0.5
# http://sandipbgt.com/2015/10/01/control-screen-brightness-from-commandline-in-ubuntu
brightness(){
    # $1 - nome do monitor, choose with monitors function
    # $2 - lvl 0 at 1
    xrandr --output $1 --brightness $2
}

# When have one monitor only...
# USE: bmonitor 0.5
bmonitor(){
    # $1 - lvl 0 at 1
    xrandr --output $(monitors) --brightness $1
}

# REST CLIENTE COM CURL #

# USE: rcp req localhost:5050/api/sample
# req equivale a um arquivo existente req.json
rcp(){
    curl -X POST -H "Content-Type: application/json" -d @$1.json $2
}

# USE: rcg localhost:5050/api/sample
# Arquivo de resposta disponivel em /tmp/resp.json
rcg(){
    curl $1 > /tmp/resp.json && cat /tmp/resp.json
}
