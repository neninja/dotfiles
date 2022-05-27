" 'Framework' de testes com a pegada do udebug https://www.udebug.com/UVa/100
" Onde é feito um diff do output de um script e o arquivo `outputassertion.txt`
" Exemplo: `:RawTest python`
" Exemplo: `:DumpScript`

let s:executaveisPorExtensao = {
            \ 'lua': 'lua',
            \ 'php': 'php',
            \ 'go': 'go run',
            \ 'py': 'python3',
            \ 'js': 'node'
            \}

function! s:OutputAssertion()
    try
        let command = s:executaveisPorExtensao[expand('%:e')]
    catch
        echo "Extensão não mapeada"
        return
    endtry

    execute "tabnew | 0r!".command." #"

    if(v:shell_error > 0)
        q!
        echo "Executável não encontrado"
        return
    endif

    " faz o vim entender que não queremo salvar esse arquivo
    setlocal buftype=nofile
    normal! Gdd
    nnoremap <buffer> q :windo bd!<CR>
    new

    " deixar em cima a mensagem
    " caso tenha: set splitbelow
    " é o ideal
    " wincmd r
    normal! iUse "q" para fechar todos os buffers

    " faz o vim entender que não queremo salvar esse arquivo
    setlocal buftype=nofile
    wincmd w

    " resize o máximo
    wincmd _

    vert diffsplit outputassertion.txt
    nnoremap <buffer> q :windo bd!<CR>
    wincmd l
endfunction

let g:current_filetype=""
let g:current_terminal=0

function! s:ExecuteCurrentBufferFile()
    if g:current_terminal
        " ocorre erro caso o buffer não exista mais
        try
            execute "bd! ".g:current_terminal
        catch
        endtry
    endif
    try
        let command = s:executaveisPorExtensao[expand('%:e')]
    catch
        echo "Extensão não mapeada"
        return
    endtry
    cclose

    let g:current_filetype=&filetype
        new
        execute "set filetype=".g:current_filetype
        set buftype=terminal
        execute "silent 0r!".command." #"
        let g:current_terminal = bufnr()
        silent cgetbuffer
        execute "b ".g:current_terminal
        set filetype=txt
        cw
endfunction

command! RawTest :call <SID>OutputAssertion()
command! DumpScript :call <SID>ExecuteCurrentBufferFile()
