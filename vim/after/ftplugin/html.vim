" 0r ~/dev/dotfiles/vim/skeletons/skeleton.html
inoremap <buffer> <c-t> </<c-x><c-o><c-n><esc>==gi

" Comenta
vnoremap <buffer>   //  I<!--<esc>A--><CR>
vnoremap <buffer>   /;  :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
nnoremap <buffer>   //  I<!--<esc>A--><CR>
nnoremap <buffer>   /;  :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>
