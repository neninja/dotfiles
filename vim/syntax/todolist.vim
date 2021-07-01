" THANKS: http://vimregex.com/
syn match todoListCardTitle /^\S.*$/ containedin=ALL
syn match todoListCardBody /^\s.*$/ containedin=ALL

syn match todoListURL /[http|https]*:\/\/[^ >,;]*/ containedin=todoListCardBody
syn match todoListWtf /\C\<????\>/ contained containedin=todoListCardBody
syn match todoListWait /\C\<WAIT\>/ contained containedin=todoListCardBody,todoListCardTitle
syn match todoListWait /\C\<TODO\>/ contained containedin=todoListCardBody,todoListCardTitle

syn match todoListBegginingList /^\s*-/ containedin=todoListCardBody
syn match todoListBegginingCheckboxEmpty /^\s*=/ containedin=todoListCardBody
syn match todoListBegginingCheckboxChecked /^\s*+/ containedin=todoListCardBody

syn match Conceal /^\s.*$/ containedin=ALL
syn match todoListBullet /-/ contained containedin=todoListBegginingList conceal cchar=•

" https://www.nerdfonts.com/cheat-sheet
if(g:devicons)
    syn match todoListCheck /=/ contained containedin=todoListBegginingCheckboxEmpty conceal cchar=
    syn match todoListEmptyCheck /+/ contained containedin=todoListBegginingCheckboxChecked conceal cchar=
else
    syn match todoListCheck /=/ contained containedin=todoListBegginingCheckboxEmpty conceal cchar=□
    syn match todoListEmptyCheck /+/ contained containedin=todoListBegginingCheckboxChecked conceal cchar=✓
endif

hi link todoListCardTitle Folded

hi link todoListWtf Todo
hi link todoListWait Todo

hi link todoListCardBody PreProc
hi link todoListBullet todoListCardBody

hi clear Conceal
hi link Conceal todoListCardBody

" mantem conceal
set concealcursor=nv
