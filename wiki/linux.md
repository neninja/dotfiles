# Linux
## Comandos
| Comando                                             | Categoria        | Descrição                                                            |
|-----------------------------------------------------|------------------|----------------------------------------------------------------------|
| rm -rf * .*                                         | Arquivos/folders | Apagar quais quer arquivos ou folders do diretório                   |
| du -sh *                                            | Arquivos/folders | Mostra espaço ocupado pelos folders no diretório                     |
| apt list                                            | Arquivos/folders | Mostra programas/pacotes instalados                                  |
| fc                                                  | Geral            | Retorna ultimo comando para editar em $EDITOR                        |
| ATALHO no Terminal <C-X><C-E>                       | Geral            | Abre editor de texto para escrever comando                           |
| xrandr                                              | Monitores        | Lista monitores                                                      |
| xrandr --auto                                       | Monitores        | Habilita todos monitores                                             |
| xrandr --output <monitor> --auto                    | Monitores        | Habilita monitor especifico como extensão                            |
| xrandr --output <monitor> --same-as <main-monitor>  | Monitores        | Habilita monitor especifico como extensão igual do main-monitor      |
| xrandr --output <monitor> --left-of <main-monitor>  | Monitores        | Habilita monitor especifico como extensão a esquerda do main-monitor |
| xrandr --output <monitor> --right-of <main-monitor> | Monitores        | Habilita monitor especifico como extensão a direita do main-monitor  |
| xrandr --output <monitor> --above <main-monitor>    | Monitores        | Habilita monitor especifico como extensão a cima do main monitor     |
| xrandr --output <monitor> --bellow <main-monitor>   | Monitores        | Habilita monitor especifico como extensão a baixo do main-monitor    |
| lsblk                                               | Disco            | Lista discos/pendrives                                               |
| mount /dev/sdb1 /media/folderexistente              | Disco            | Exibe arquivos do pendrive em /media/folderexistente                 |
| lshw                                                | Hardware Geral   | Lista completa do hardware do comptador                              |
| fc-list                                             | Fonts            | Lista completa de fontes instaladas                                  |
| startx                                              | Software         | Inicia xorg/xserver                                                  |
| more                                                | Software         | Quando usado com pipe, carrega melhor a visualização do terminal     |
| dpkg -i <.deb>                                      | Software         | Instala software de arquivo.deb                                      |