" THANKS: http://vimregex.com/
syn match todoneListCardTitle /^\S.*$/ containedin=ALL
syn match todoneListCardBody /^\s.*$/ containedin=ALL

syn match todoneListURL /[http|https]*:\/\/[^ >,;]*/ containedin=todoneListCardBody,todoneListCardTitle
syn match todoneListWhat "????" contained containedin=todoneListCardBody,todoneListCardTitle
syn match todoneListWait /\C\<WAIT\>/ contained containedin=todoneListCardBody,todoneListCardTitle
syn match todoneListDone /\C\<DONE\>/ contained containedin=todoneListCardBody,todoneListCardTitle
syn match todoneListTodo /\C\<TODO\>/ contained containedin=todoneListCardBody,todoneListCardTitle

syn match todoneListBegginingList /^\s*-/ containedin=todoneListCardBody

syn match Conceal /^\s.*$/ containedin=ALL
syn match todoneListBullet /-/ contained containedin=todoneListBegginingList conceal cchar=•

hi link todoneListCardTitle Folded

hi link todoneListWhat DiffDelete
hi link todoneListWait DiffText
hi link todoneListDone DiffAdd
hi link todoneListTodo Todo

hi link todoneListCardBody PreProc
hi link todoneListBullet todoneListCardBody

hi clear Conceal
hi link Conceal todoneListCardBody

" mantem conceal
set concealcursor=nv
