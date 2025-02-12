if exists("b:current_syntax")
  finish
endif
let b:current_syntax = 'ttkaer'

syntax keyword ttkaerKeyword print return class function var if else while for
syntax keyword ttkaerFunction print return function

syntax match ttkaerVariable /\v\$\w+/

syntax match ttkaerNumber /\v\d+(\.\d+)?/

syntax match ttkaerString /".*"/

syntax keyword ttkaerType string number boolean

highlight ttkaerKeyword ctermfg=Blue guifg=#0000FF
highlight ttkaerFunction ctermfg=Yellow guifg=#FFFF00
highlight ttkaerVariable ctermfg=Green guifg=#00FF00
highlight ttkaerNumber ctermfg=Red guifg=#FF0000
highlight ttkaerString ctermfg=Cyan guifg=#00FFFF
highlight ttkaerType ctermfg=Magenta guifg=#FF00FF

setlocal foldmethod=syntax
setlocal foldminlines=1

syntax region ttkaerFold start="{" end="}" transparent fold
syntax region ttkaerFold start="\[" end="\]" transparent fold
