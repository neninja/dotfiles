" :map -> lista todos mapeamentos para o arquivo

"*********************************************************
" Custom configs langs
"*********************************************************
" Funções para comentar/decomentar linha a linha de código
" Parâmetro deve ser entre aspas e conter, se necessário, espaço e contra-barra
" https://vim.fandom.com/wiki/Easy_(un)commenting_out_of_source_code
function ComentaNormal(carac1, carac2)
    execute "normal! I".a:carac1
    execute "normal! A".a:carac2
endfunction

function ComentaVisual(carac1, carac2)
    execute "normal! I".a:carac1
    execute "normal! A".a:carac2
endfunction

"#########################################
" HTML
"#########################################
augroup html
    " Comenta
    au FileType html vnoremap // :call ComentaVisual("<!-- ", " -->")<CR>
    au FileType html vnoremap /; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
    au FileType html nmap // :call ComentaNormal("<!-- ", " -->")<ESC>
    au FileType html nmap /; :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>

    au FileType html :so ~/dev/dotfiles/vim/plugins/matchit.vim
augroup END

"#########################################
" GO
"#########################################
augroup go
    " Comenta
    au FileType go vnoremap // :call ComentaVisual("// ", "")<CR>
    au FileType go vnoremap /; :s/\/\/\s/<CR>:noh<CR>
    au FileType go nmap // :call ComentaNormal("// ")<esc>
    au FileType go nmap /; :s/\/\/\s/<CR>:noh<CR>
augroup END

"#########################################
" VUE
"#########################################
autocmd BufRead,BufNewFile *.vue setfiletype html

"#########################################
" MARKDOWN
"#########################################
augroup markdown
    " Converte arquivo file.md atual em file.md.pdf
    au FileType markdown nmap <leader>r <Esc>:w<CR>:!clear;pandoc % -o %.pdf<CR><CR>
    " Abre file.md.pdf com comando comando $PDFVIEWER
    au FileType markdown nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
augroup END

"#########################################
" CSV
"#########################################
augroup csv
    " Transforma como md em /tmp, salva, converte em pdf com pandoc em /tmp e fecha buffer; abre pdfviewer
    "au FileType csv nmap <leader>r <Esc>:w<CR>:sav! /tmp/%.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-<ESC>:%s/;/\|/<CR>:w<CR>:!echo /tmp/'%:r'.pdf <CR>
    "au FileType csv nmap <leader>r <Esc>:w<CR>:sav! /tmp/%.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-<ESC>:%s/;/\|/<CR>:w<CR>:!echo /tmp/'%:r'.pdf <CR>
    au FileType csv nmap <leader>r <Esc>:w<CR>:sav! %.md<CR><ESC>:setfiletype markdown<CR>ggo-\|-\|-<ESC>:%s/;/\|/g<CR>:w<CR>:!pandoc % -o '%:r'.pdf<CR><CR>:bd<CR>
    au FileType csv nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
augroup END

"#########################################
" DOT GV
"#########################################
au! BufRead,BufNewFile *.gv       setfiletype dot
augroup dot
    au FileType dot nmap <leader>r <Esc>:w<CR>:call LimpaTerminal()<CR>:!dot -Tpdf -O %<CR><CR>
    au FileType dot nmap <leader>i <Esc>:w<CR>:call LimpaTerminal()<CR>:!dot -Tpng % -O<CR><CR>
    au FileType dot nmap <leader>e <Esc>:w<CR>:!clear;$PDFVIEWER %.pdf &<CR><CR>
    au FileType dot imap >> <SPACE>-><SPACE>
augroup END

"#########################################
" SHELL
"#########################################
augroup sh
    au FileType sh nmap <leader>r <Esc>:w<CR>:!clear;chmod +x % ; ./%<CR>
augroup END

"#########################################
" LATEX
"#########################################
augroup tex
    " Comenta
    au FileType tex vnoremap // :call ComentaVisual("% ", "")<CR>
    au FileType tex vnoremap /; :s/%\s/<CR>:noh<CR>
    au FileType tex nmap // :call ComentaNormal("% ", "")<esc>
    au FileType tex nmap /; :s/%\s/<CR>:noh<CR>

    " É necessário compilar duas vezes para ter certeza de atualizar a toc
    " https://tex.stackexchange.com/questions/301103/empty-table-of-contents
    " Também compilar bibliografia e mais uma vez a toc
    " Erros salvos em log
    au FileType tex nmap <leader>r <Esc>:w<CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;bibtex '%:r' > bibtex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>:!clear;pdflatex '%:r' > pdflatex.log<CR><CR>
    au FileType tex nmap <leader>e <Esc>:!clear;$PDFVIEWER '%:r'.pdf &<CR><CR>
augroup END

" Reconhecer classes com syntax de latex
au BufNewFile,BufRead *.cls set filetype=tex

"#########################################
" PYTHON
"#########################################
augroup python
    au FileType python nmap <leader>r :vsp<CR>:terminal python3 %<CR>
    au FileType python vnoremap // :call ComentaVisual("# ", "")<CR>
    au FileType python vnoremap /; :s/#\s/<CR>:noh<CR>
    au FileType python nmap // :call ComentaNormal("# ", "")<esc>
    au FileType python nmap /; :s/#\s/<CR>:noh<CR>
augroup END

"#########################################
" PHP
"#########################################
augroup python
    au FileType php nmap <leader>r :terminal php %<CR>
    au FileType php vnoremap // :call ComentaVisual("// ", "")<CR>
    au FileType php vnoremap /; :s/\/\/\s/<CR>:noh<CR>
    au FileType php nmap // :call ComentaNormal("// ", "")<esc>
    au FileType php nmap /; :s/\/\/\s/<CR>:noh<CR>
augroup END

"#########################################
" JAVASCRIPT
"#########################################
augroup javascript
    au FileType javascript vnoremap // :call ComentaVisual("// ", "")<CR>
    au FileType javascript vnoremap /; :s/\/\/\s/<CR>:noh<CR>
    au FileType javascript nmap // :call ComentaNormal("// ", "")<esc>
    au FileType javascript nmap /; :s/\/\/\s/<CR>:noh<CR>
augroup END

"#########################################
" VIMSCRIPT
"#########################################
augroup vim
    au FileType vim vnoremap // :call ComentaVisual("\" ", "")<CR>
    au FileType vim nmap // :call ComentaNormal("\" ", "")<esc>
augroup END
