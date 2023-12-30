" All credits of algorithm Pierre-Guy Douyon and Monkeytype
" THANKS: https://github.com/pgdouyon/vim-yin-yang
" THANKS: https://monkeytype.com/settings
"
" TOOLS:
"   https://www.colorhexa.com
"   https://jonasjacek.github.io/colors/

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vimwiki_comfymonkey"

function! s:hi(group, fg, bg, style)
  execute "hi! ".a:group
        \." guifg="  .s:NONE(a:fg)
        \." guibg="  .s:NONE(a:bg)
        \." gui="    .s:NONE(a:style)
endfunction

function! s:NONE(attr)
  return empty(a:attr) ? "NONE" : a:attr
endfunction

"# Colors
let s:black       = '#000000'
let s:red01       = '#df5757'
let s:cyan01      = '#5fd7d7'
let s:green01     = '#5fd75f'
let s:purple01    = '#5f5fd7'
let s:blue01      = '#5f9bd7'
let s:blue02      = '#5f5fd7'
let s:neonyellow01 = '#afff5f'
let s:neonblue01   = '#5fffff'

"# Roles
let s:fg          = '#f5efee'
let s:bg          = '#4a5b6e'
let s:bg2         = '#425366'
let s:majordetach = '#f8cdc6'
let s:minordetach = '#9ec1cc'
let s:patchdetach = s:neonblue01

let s:error = s:red01
let s:error = s:red01
let s:warn  = s:red01
let s:hint  = s:cyan01
let s:info  = s:purple01

"# Defs
call s:hi('Normal', s:fg, s:bg, '')
call s:hi('Comment', s:minordetach, '', 'bold')
call s:hi('Type', s:fg, '', '')
call s:hi('Special', s:fg, '', '')
call s:hi('Identifier', s:fg, '', '')
call s:hi('Statement', s:fg, '', '')
call s:hi('Constant', s:fg, '', '')
call s:hi('Keyword', s:minordetach, '', 'bold')
call s:hi('Title', s:majordetach, '', 'bold')
call s:hi('Todo', s:majordetach, '', 'bold')

call s:hi('PreProc', s:minordetach, '', 'bold')

call s:hi('LineNr', s:bg, '', '')
call s:hi('qfLineNr', s:minordetach, '', '')
call s:hi('NonText', s:bg, '', '')

call s:hi('Error', s:error, '', 'bold')
call s:hi('ErrorMsg', s:error, '', '')

hi! link Folded Normal
hi! link FoldColumn Normal
hi! link SignColumn FoldColumn
hi! link ColorColumn FoldColumn
hi! link CursorColumn CursorLine

hi! link Conceal Normal
hi! link Conceal Normal

call s:hi('Visual', s:fg, s:minordetach, '')
call s:hi('Search', s:minordetach, s:bg2, '')
call s:hi('IncSearch', s:minordetach, s:bg2, '')

call s:hi('Substitute', s:bg, s:patchdetach, 'bold')

call s:hi('Cursor', s:fg, s:majordetach, '')
call s:hi('Underlined', s:minordetach, '', 'underline')

call s:hi('MatchParen', s:majordetach, s:bg2, '')

call s:hi('StatusLine', '', '', 'inverse')
call s:hi('StatusLineNC', '', s:bg2, '')

call s:hi('Pmenu', s:fg, s:bg2, '')
call s:hi('PmenuSbar', s:bg, '', '')
call s:hi('PmenuSel', '', '', 'inverse')
call s:hi('PmenuThumb', s:fg, '', '')

call s:hi('DiffAdd', '', s:green01, '')
call s:hi('DiffChange', '', s:blue02, '')
call s:hi('DiffDelete', '', s:red01, '')
call s:hi('DiffText', s:bg, s:blue01, '')
call s:hi('DiffAdded', s:green01, '', '')
call s:hi('DiffChanged', s:blue02, '', '')
call s:hi('DiffRemoved', s:red01, '', '')

call s:hi('VimwikiLink', s:minordetach, '', '')
hi! link VimwikiHeaderChar Title
call s:hi('VimwikiList', s:majordetach, '', 'bold')
