" Desenho de diagramas, útil para apresentações em markdown
"
"  +-----+     +-----+
"  |texto|     |texto|
"  +--+--+     +-----+
"     |           ^
"     |           |
"     |        +--+--+ 
"     +------->|texto|
"              +-----+

" Caixas:
" 1. `set ve=all`
" 2. `<c-v>`
" 3. Selecione um quadrado
" 4. Aperte +

" Conectores:
" 1. `set ve=all`
" 2. `<c-v>`
" 3. Selecione a partir de uma linha da caixa até antes do início da próxima
" 4. Aperte -

" THANKS: https://github.com/vim-scripts/DrawIt/blob/master/autoload/DrawIt.vim#L2494
function! s:Boxdraw()
    set virtualedit=all

    " Cancela virtual edit
    "set virtualedit=

    let row0 = line("'<") - 1
    let col0 = virtcol("'<") - 1
    let row1 = line("'>") + 1
    let col1 = virtcol("'>") + 1
    
    " FIXME criando quadrado de cima o baixo esquerda para direita ok,
    " restante não. Pq?
    " echo row0 . "-" . col0 . "-" . row1 . "-" . col1

    let quantidadeL = col1 - col0
    call cursor(row1, col0)
    exec "normal! v".quantidadeL."lr-"
    call cursor(row0, col0)
    exec "normal! v".quantidadeL."lr-"

    let quantidadeJ = row1 - row0
    call cursor(row0, col0)
    exec "normal! \<c-v>".quantidadeJ."jr|"
    call cursor(row0, col1)
    exec "normal! \<c-v>".quantidadeJ."jr|"

    call cursor(row0, col0)
    normal! r+
    call cursor(row1, col0)
    normal! r+
    call cursor(row0, col1)
    normal! r+
    call cursor(row1, col1)
    normal! r+
endfunction

function! s:Connectordraw()
    " coordenadas que iniciaram ou terminaram a seleção
    let row0 = line("'<")
    let col0 = virtcol("'<")
    let row1 = line("'>")
    let col1 = virtcol("'>")

    let rowI = 0
    let colI = 0

    call cursor(row0, col0)
    let conteudoPosicaoInicial = getline('.')[col('.')-1]
    if(conteudoPosicaoInicial == '-' || conteudoPosicaoInicial == '|')
        let rowI = line('.')
        let colI = virtcol('.')
    endif
    call cursor(row1, col1)
    let conteudoPosicaoInicial = getline('.')[col('.')-1]
    if(conteudoPosicaoInicial == '-' || conteudoPosicaoInicial == '|')
        let rowI = line('.')
        let colI = virtcol('.')
    endif

    " cancela seta
    if(rowI == 0)
        return
    endif

    " TESTES: https://codepen.io/nenitf/pen/xxVwYmL?editors=0010

    let rowF = rowI == row0 ? row1 : row0
    let colF = colI == col0 ? col1 : col0

    let rowM = col0 == col1 ? rowI : rowF
    let colM = row0 == row1 ? colI : colF

    let primeiraReta = 0
    let segundaReta = 0

    call cursor(rowI, colI)
    let conteudoPosicaoInicial = getline('.')[col('.')-1]
    if(conteudoPosicaoInicial == '-')
        let primeiraReta = '|'
        let segundaReta = '-'
        let colM = colI
    else
        let primeiraReta = '-'
        let segundaReta = '|'
        let rowM = rowI
    endif

    if(rowI > rowM)
        let quantidadeJ = rowI - rowM
        call cursor(rowM, colM)
        exec "normal! \<c-v>".quantidadeJ."jr|"
    elseif(rowI < rowM)
        let quantidadeJ = rowM - rowI
        call cursor(rowI, colI)
        exec "normal! \<c-v>".quantidadeJ."jr|"
    elseif(colI > colM)
        call cursor(rowM, colM)
        let quantidadeL = colI - colM
        exec "normal! v".quantidadeL."lr-"
    elseif(colI < colM)
        call cursor(rowI, colI)
        let quantidadeL = colM - colI
        exec "normal! v".quantidadeL."lr-"
    endif

    if(rowM > rowF)
        let arrowHead = '^'
        let quantidadeJ = rowM - rowF
        call cursor(rowF, colF)
        exec "normal! \<c-v>".quantidadeJ."jr|"
    elseif(rowM < rowF)
        let arrowHead = 'v'
        let quantidadeJ = rowF - rowM
        call cursor(rowM, colM)
        exec "normal! \<c-v>".quantidadeJ."jr|"
    elseif(colM > colF)
        let arrowHead = '<'
        let quantidadeL = colM - colF
        call cursor(rowF, colF)
        exec "normal! v".quantidadeL."lr-"
    elseif(colM < colF)
        let arrowHead = '>'
        let quantidadeL = colF - colM
        call cursor(rowM, colM)
        exec "normal! v".quantidadeL."lr-"
    endif

    call cursor(rowI, colI)
    normal! r+
    call cursor(rowM, colM)
    normal! r+
    call cursor(rowF, colF)
    exec "normal! r".arrowHead
endfunction

vnoremap + :<c-u>call <SID>Boxdraw()<CR>
vnoremap - :<c-u>call <SID>Connectordraw()<CR>

