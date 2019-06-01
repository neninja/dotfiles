# Functions
# =====================
# DESC: Ver previsão do tempo para Porto Alegre
# USE: wttr
wttr(){
curl wttr.in/porto+alegre?lang=pt-br
}

# DESC: Abrir folder com feh em tamanho centralizado
# USE: f
# USE: f image.jpg
f(){
    feh -q -. $1
}

# DESC: Acessar dotfiles o folder rapidamente
# USE: cdf
# USE: cdf feh
cdf(){
    cd ~/dev/dotfiles/$1
}

# DESC: Servidor php
# USE: phps 8080
phps(){
    php -S localhost:$1
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
    (echo -n '# '; pwd | rev | cut -d '/' -f1 | rev)>README.md;
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

################################################
# OLUME E BRILHO 
################################################

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

################################################
# PENDRIVES
################################################

# DESC: Formatar pendrive
# USE: fmtpendrive sdb1
fmtpendrive(){
    # identificar pendrive: sudo fdisk -l
    sudo mkfs.vfat -I /dev/$1
}

################################################
# REST CLIENTE COM CURL
################################################
# OBJ: Utilizar curl como rest client invés de postman etc

# DESC: Requisição GET com arquivo json de resposta
# USE: rcg localhost:5050/api/sample
rcg(){
    curl $1 > /tmp/resp.json && cat /tmp/resp.json
}

# DESC: Requisição post com arquivo json para envio
# USE: rcp req localhost:5050/api/sample
# req equivale a um arquivo existente req.json
rcp(){
    curl -X POST -H "Content-Type: application/json" -d @$1.json $2
}


################################################
# FFMPEG
################################################

# DESC: Gravar tela (metade-esquerda ou tamanho especificado)
# USE: ffmpegs final.mp4
# USE: ffmpegs final.mp4 -s 1366x768
ffmpegs(){
    mkdir -p ~/Vídeos/ffmpeg

    # https://ffmpeg.org/ffmpeg-all.html
    # https://ffmpeg.org/ffmpeg-devices.html#x11grab
    # screen dimension with xdpyinfo
    ffmpeg -f x11grab $2 -i :0.0 ~/Vídeos/ffmpeg/$1
}

# DESC: Dobrar velocidade de um vídeo
# USE: ffmpeg2 input.mp4 output.mp4
ffmpeg2(){
    # https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
    ffmpeg -i $1 -filter:v "setpts=0.5*PTS" $2
}

# DESC: Compatibilizar vídeos para o whatsapp
# USE: ffmpegwp broken.mp4 working.mp4
ffmpegwp(){
    # Videos gravados com ffmpeg para wpp
    # https://stackoverflow.com/questions/39887869/ffmpeg-whatsapp-video-format-not-supported
    ffmpeg -i $1 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p $2
}

################################################
# IMAGEMAGICK
################################################

# DESC: Capturar tela
# USE: sc
sc(){
    mkdir -p ~/Imagens/Screenshots
    local NOME_IMG=$(echo "screenshot-$(date -d now "+%Y-%m-%d--%Hh-%Mm-%Ss")")
    import ~/Imagens/Screenshots/$NOME_IMG.jpg
}
