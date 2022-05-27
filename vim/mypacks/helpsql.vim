" Auxilio de psql. Utilização:
" 1. Declarar em um local não versionado (pelas senhas):
"
"   let g:dbs_psql = [
"     \ { 'name': 'name_connection', 'url': '[<user>[:<password>]@][<host>[:<port>]]/[<database>]' },
"     \ { 'name': 'db_dev', 'url': 'username:password@localhost:5432/database' },
"     \ { 'name': 'db_prod', 'url': 'username:password@localhost:5432/database' },
"     \ ]
"   let g:db_psql = 'name_conection'
" 
"   function! g:PsqlCompleteTable(A, L, P) abort
"       let commands = [ 
"                   \ "users",
"                   \]
"       return filter(commands, 'v:val =~ "^" . a:A')
"   endfunction
" 
" 2. Executar o `:Psql select * from table where name = 'nome'`
"
" Outros comandos:
" :Psql
" :PsqlSelectAllFrom
" :PsqlSelectAllTables

function! s:PsqlComplete(A, L, P) abort
    let commands = [ 
                \ "SELECT ",
                \ "SELECT * ",
                \ "TOP ",
                \ "FROM ",
                \ "WHERE ",
                \ "LIMIT ",
                \]
    return filter(commands, 'v:val =~ "^" . a:A')
endfunction

" THANKS: https://github.com/tpope/vim-dadbod
command! -nargs=+ -complete=customlist,s:PsqlComplete Psql exe 'RunCmd psql -w --dbname postgresql://'.g:dbs_psql[g:db_psql]["url"].' -c "'.<q-args>.'"'
command! -nargs=1 -complete=customlist,g:PsqlCompleteTable PsqlSelectAllFrom exe 'Psql select * from '.<q-args>
command! PsqlSelectAllTables Psql SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name

