# Functions
# =====================
# DESC: Ver previsão do tempo para Porto Alegre
# USE: wttr
wttr(){
    curl wttr.in/porto+alegre?lang=pt-br
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
# VOLUME E BRILHO 
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
# REST CLIENT COM CURL
################################################
source $DF/scripts/restc.sh

################################################
# FFMPEG
################################################

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
