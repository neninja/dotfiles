let g:print_debug_pattern = {
            \   'go':               '^\s*fmt.Println(\p*)',
            \   'python':           '^\s*print(\p*)',
            \   'php':              '^\s*var_dump(\p*);die;',
            \   'javascript':       '^\s*console.log(\p*)',
            \   'typescript':       '^\s*console.log(\p*)',
            \   'typescriptreact':  '^\s*console.log(\p*)',
            \ }

command! DankDebug exe "noautocmd vimgrep /".g:print_debug_pattern[&filetype]."/g ".expand("%") | cope

