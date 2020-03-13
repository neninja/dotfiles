highlight Normal guifg=white guibg=black

set guioptions-=T  " tool bar
set guioptions-=m  " menu bar
set guioptions-=r  " scroll bar direita
set guioptions-=L  " scroll bar esquerda quando a janela possuir split vertical

" Alerts
" http://vimdoc.sourceforge.net/htmldoc/gui_w32.html
if has("win32")
    au GUIEnter * simalt ~x
endif

" Colocar em ~/.extra.gvim.vim, pois varia de sistema operacional ...
" set guifont=UbuntuMono\ NF:h11
" set guifont=Fira\ Code:h10
" set guifont=Consolas:h11
" Para ver as opções de font: set guifont=*
