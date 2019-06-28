#!/usr/bin/env bash
#
# Rest Curl
#
# Autor: Felipe Silva
#	Site: neni.dev
# 	Github: nenitf
#	Gitlab: nenitf
#
# O que é:
#   Rest client com curl
#
# Comandos:
#   Cada função deste arquivo é um comando,
#   seus exemplos estão comentados imediatamente acima
#
# Como habilitar comando nn?
#   Referenciar este arquivo em seu bashrc
#       source /path/to/ninjanotes.sh
#

# DESC: Requisição GET com arquivo json de resposta
# USE: restcg localhost:5050/api/sample
restcg(){
    # localhost:3333/posts  ->  localhost_posts
    local URL_FILENAME=$(echo $1| sed -r 's/localhost:[0-9]*/localhost/g' | sed -r 's/\//_/g')
    local FILE_RES="/tmp/restc-g-res_$URL_FILENAME.json"

    # Faz a requisição
    curl -# -w %{content_type}"\n\n" -o $FILE_RES $1

    echo "Resposta: $FILE_RES"

    # Pode optar pelo print com ou sem indentação
    # https://stackoverflow.com/questions/2875424/correct-way-to-check-for-a-command-line-flag-in-bash
    if [[ $* == *--no-json-format* ]]; then
        cat $FILE_RES
        echo ""
    else
        cat $FILE_RES | python -m json.tool
        # É possível identar o arquivo pelo vim ou nvim com:
        #   :%!python -m json.tool
    fi
}

# DESC: Requisição post sem body
# USE: restcp req localhost:5050/api/sample
#   req equivale a um arquivo existente req.json
restcp(){
    # localhost:3333/posts  ->  localhost_posts
    local URL_FILENAME=$(echo $1| sed -r 's/localhost:[0-9]*/localhost/g' | sed -r 's/\//_/g')
    local FILE_RES="/tmp/restc-p-res_$URL_FILENAME.json"

    # Faz a requisição
    curl -# -X POST -w %{content_type}"\n\n" -o $FILE_RES $1

    echo -e "Responsta: $FILE_RES\n"

    # Pode optar pelo print com ou sem indentação
    # https://stackoverflow.com/questions/2875424/correct-way-to-check-for-a-command-line-flag-in-bash
    if [[ $* == *--no-json-format* ]]; then
        cat $FILE_RES
        echo ""
    else
        cat $FILE_RES | python -m json.tool
        # É possível identar o arquivo pelo vim ou nvim com:
        #   :%!python -m json.tool
    fi
}

# DESC: Requisição post com arquivo json para envio
# USE: restcpj req localhost:5050/api/sample
#   req equivale a um arquivo existente req.json
restcpj(){
    curl -X POST -H "Content-Type: application/json" -d @$1.json $2
}

# DESC: Requisição post com multipart/form para envio
# USE: restcpm
# USE: restcpm localhost:5050/api/sample
# USE: restcpm localhost:5050/api/sample --template
# USE: restcpm localhost:5050/api/sample --repeat
# OBS: pode usar a flag --no-json-format em qualquer posição, exceto $1
restcpm(){
    # localhost:3333/posts  ->  localhost_posts
    local URL_FILENAME=$(echo $1| sed -r 's/localhost:[0-9]*/localhost/g' | sed -r 's/\//_/g')
    local FILE_REQ="/tmp/restc-pm-req_$URL_FILENAME.txt"
    local FILE_RES="/tmp/restc-pm-res_$URL_FILENAME.json"

    # Caso não seja passado endereço site, retorna arquivo de resposta
    # facilita a visualização do arquivo
    if [ $# -eq 0 ]; then
        $EDITOR $FILE_RES
        return 1
    fi

    # Caso não queira repetir cegamente arquivo $FILE_REQ existente
    if [[ ! $2 == "--repeat" ]]; then

        # Caso queira o arquivo $FILE_REQ com o template
        # ou o arquivo não exista
        if [[ $2 == "--template" ]] || [ ! -e $FILE_REQ ]; then
            # escreve template de reuisição -F curl
            echo -e '#-F "userid=1"\' > $FILE_REQ
            echo -e '#-F "image=@/home/neni/test.jpg"\' >> $FILE_REQ
        fi
        # Abre arquivo com editor padrão do SO
        $EDITOR $FILE_REQ

    # Caso o arquivo $FILE_REQ não exista, não tem como repetir a requisição
    elif [ ! -e $FILE_REQ ]; then
        echo "Arquivo de requisição não inicializado, repita o comando sem a flag --repeat"
        return 1
    fi

    # Faz a requisição
    curl -# -X POST -w %{content_type}"\n\n" -o $FILE_RES -K $FILE_REQ $1

    echo -e "Request: $FILE_REQ\nResponse: $FILE_RES\n"

    # Pode optar pelo print com ou sem indentação
    # https://stackoverflow.com/questions/2875424/correct-way-to-check-for-a-command-line-flag-in-bash
    if [[ $* == *--no-json-format* ]]; then
        cat $FILE_RES
        echo ""
    else
        cat $FILE_RES | python -m json.tool
        # É possível identar o arquivo pelo vim ou nvim com:
        #   :%!python -m json.tool
    fi
}

# DESC: Lembra como usar as funções de rest com curl
# USE: rest
rest(){
    echo "restcg [url] -> rest curl get"
    echo "restcpj [url] -> rest curl post json"
    echo "restcpm [url] -> rest curl post multipart/form"
}

# DESC: Lembra como usar as funções de rest com curl
# USE: restc
restc(){
    rest
}

