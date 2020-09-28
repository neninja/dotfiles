" Créditos: https://stackoverflow.com/a/24091111
syn match vimInlineComment '|\s*".*$' containedin=ALL
" syn match vimMapRhs '|\s*".*' contains=vimLineComment
" syn match vimLineComment '|\s*".*$' containedin=vimMapRhs
hi link vimInlineComment Comment
