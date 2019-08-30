# DESC: Ver previsão do tempo para Porto Alegre
# USE: wttr
wttr(){
    curl wttr.in/porto+alegre?lang=pt-br
}

# DESC: Servidor php
# USE: phps 8080
# USE: phps 8080 -t public
phps(){
    php -S localhost:$@
}

# DESC: bin npm
# USE: nb cypress open
nb(){
    $(npm bin)/$@
}

# DESC: Criar e entrar na pasta
# USE: mk folder
mk(){
    mkdir $1;
    cd $1;
}