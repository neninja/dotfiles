" THANKS: http://vimregex.com/
syn match todoListCardTitle /^\S.*$/ containedin=ALL
syn match todoListCardBody /^\s.*$/ containedin=ALL

syn match todoListBegginingList /^\s*-/ contained containedin=todoListCardBody
syn match todoListBegginingCheckbox /^\s*-\s\[\p\]/ contained containedin=todoListCardBody
syn match todoListURL /[http|https]*:\/\/[^ >,;]*/ contained containedin=todoListCardBody

syn match Conceal /^\s.*$/ containedin=ALL
syn match todoListBullet /-/ contained containedin=todoListBegginingList conceal cchar=•
syn match todoListItemCheckbox /-\s\[\p\]/ contained containedin=todoListBegginingCheckbox conceal
syn match todoListCheckbox /\[\p\]/ contained containedin=todoListItemCheckbox
syn match todoListCheck /\s/ contained containedin=todoListCheckbox conceal cchar=□
syn match todoListEmptyCheck /x/ contained containedin=todoListCheckbox conceal cchar=✓

" FIXME utilizar highlight de TODO em Folded sem afetar outros ftp
hi link Folded Todo
hi link todoListCardTitle Folded
" hi link todoListCardTitle Todo

hi link todoListCardBody PreProc
hi link todoListBullet todoListCardBody

hi clear Conceal
hi link Conceal todoListCardBody

" mantem conceal
set concealcursor=nv
