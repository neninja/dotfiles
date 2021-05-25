" 0r ~/dev/dotfiles/vim/skeletons/skeleton.html
"inoremap <buffer> <c-t> </<c-x><c-o><c-n><esc>==gi

" Comenta
vnoremap <buffer>   //  I<!--<esc>A--><CR>
vnoremap <buffer>   /;  :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
nnoremap <buffer>   //  I<!--<esc>A--><CR>
nnoremap <buffer>   /;  :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>

inorea <buffer><expr> html TestaTriggerSnippet('html',
            \ "<!DOCTYPE html><cr>".
            \ "<html><cr>".
            \ "<head><cr>".
            \ '<meta charset="UTF-8">'."<cr>".
            \ '<meta name="viewport" content="width=device-width, initial-scale=1.0">'."<cr>".
            \ "<title>App</title><cr>".
            \ "</head><cr>".
            \ "<body><cr>".
            \ "</body><cr>".
            \ "</html>",
            \ [])

inoremap <buffer> <c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit
inoremap <buffer> <c-d><c-s> <esc>bi<<esc>ea/><esc>
inoremap <buffer> <c-d><c-d> <esc>"tyiwi<<esc>ea></<esc>"tpa><esc>cit<cr><esc>O
