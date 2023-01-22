" All credits of colors and algorithm Pierre-Guy Douyon
" THANKS: https://github.com/pgdouyon/vim-yin-yang
"
" TOOLS:
"   https://www.colorhexa.com
"   https://jonasjacek.github.io/colors/

command! Syntax echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
" THANKS: https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
":so $VIMRUNTIME/syntax/hitest.vim

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "calmo"

function! s:hi(group, fg, bg, style)
  execute "hi! ".a:group
        \." guifg="  .s:NONE(a:fg[0])." ctermfg=" .s:NONE(a:fg[1])
        \." guibg="  .s:NONE(a:bg[0])." ctermbg=" .s:NONE(a:bg[1])
        \." gui="    .s:NONE(a:style)." cterm="   .s:NONE(a:style)
endfunction

function! s:NONE(attr)
  return empty(a:attr) ? "NONE" : a:attr
endfunction

"## Colors
let s:white     = ['#eeeeee', 255]
let s:gray01    = ['#e4e4e4', 254]
let s:gray02    = ['#c6c6c6', 251]
let s:gray03    = ['#bcbcbc', 250]
let s:gray04    = ['#b2b2b2', 249]
let s:gray05    = ['#a8a8a8', 248]
let s:gray06    = ['#9e9e9e', 247]
let s:gray07    = ['#949494', 246]
let s:gray08    = ['#8a8a8a', 245]
let s:gray09    = ['#808080', 244]
let s:gray10    = ['#767676', 243]
let s:gray11    = ['#666666', 242]
let s:gray12    = ['#585858', 240]
let s:gray13    = ['#4e4e4e', 239]
let s:gray14    = ['#444444', 238]
let s:gray15    = ['#262626', 235]
let s:gray16    = ['#1c1c1c', 234]
let s:gray17    = ['#1b1b1b', 247]
let s:gray18    = ['#191919', 248]
let s:gray19    = ['#1b1b1b', 249]
let s:gray20    = ['#171717', 250]
let s:gray21    = ['#141414', 251]
let s:gray22    = ['#0d0d0d', 254]

" let s:stratosphere01    = ['#f8fbfb', 254]
" let s:stratosphere02    = ['#deeaee', 251]
" let s:stratosphere03    = ['#c5dae0', 250]
" let s:stratosphere04    = ['#b8d1da', 249]
" let s:stratosphere05    = ['#abc9d3', 248]
" let s:stratosphere06    = ['#9ec1cc', 247]
" let s:stratosphere07    = ['#91b9c5', 246]
" let s:stratosphere08    = ['#84b1be', 245]
" let s:stratosphere09    = ['#77a8b8', 244]
" let s:stratosphere10    = ['#6ba0b1', 243]
" let s:stratosphere11    = ['#5e98aa', 242]
" let s:stratosphere12    = ['#548ea0', 240]
" let s:stratosphere13    = ['#477786', 239]
" let s:stratosphere14    = ['#39606d', 238]
" let s:stratosphere15    = ['#2c4a53', 235]
" let s:stratosphere16    = ['#1e3339', 234]

" let s:stratosphere01    = ['#eceff2', 249]
" let s:stratosphere02    = ['#e0e5ea', 248]
" let s:stratosphere03    = ['#d5dbe2', 247]
" let s:stratosphere04    = ['#c9d1db', 246]
" let s:stratosphere05    = ['#bdc7d3', 245]
" let s:stratosphere06    = ['#b1bdcb', 244]
" let s:stratosphere07    = ['#a6b3c3', 243]
" let s:stratosphere08    = ['#9aaabb', 242]
" let s:stratosphere09    = ['#8ea0b3', 240]
" let s:stratosphere10    = ['#8296ab', 239]
" let s:stratosphere11    = ['#778ca3', 238]
" let s:stratosphere12    = ['#6b829b', 235]
" let s:stratosphere13    = ['#627891', 234]
" let s:stratosphere14    = ['#5a6e85', 234]
" let s:stratosphere15    = ['#52657a', 234]
" let s:stratosphere16    = ['#4a5b6e', 234]

let s:black  = ['#000000', 232]

let s:purple01    = ['#5f5fd7', 62]

let s:brown01     = ['#d79b5f', 94]

let s:blue01      = ['#5f9bd7', 31]
let s:blue02      = ['#5f5fd7', 25]

let s:cyan01      = ['#5fd7d7', 43]

let s:green01     = ['#5fd75f', 29]

let s:red01       = ['#df5757', 88]

let s:magenta01   = ['#87005f', 89]

let s:yellow01    = ['#d7d75f', 100]

let s:neonyellow01 = ['#afff5f', 155]
let s:neonblue01   = ['#5fffff', 81]

" https://www.pantone.com/color-finder/13-1520-TCX
" PANTONE 13-1520 TCX - Rose Quartz
let s:rosequartz= ['#F7CACA', 133]

" https://www.pantone.com/color-finder/15-3919-TCX
" PANTONE 15-3919 TCX Serenity
let s:serenity  = ['#93A9D1', 67]

"## Roles
if &background == 'dark'
  let s:bg    = s:gray16
  let s:fg    = s:gray03
  let s:m01   = s:gray15
  let s:m02   = s:gray14
  let s:m03   = s:gray12
  let s:m04   = s:gray10
  let s:m05   = s:gray09
  let s:m06   = s:gray08
  let s:m07   = s:gray07
  let s:m08   = s:gray06
  let s:m09   = s:gray05
  let s:m10   = s:gray04
  let s:m11   = s:gray03
  let s:m12   = s:gray02
  let s:m13   = s:fg
  let s:m14   = s:gray02
  let s:m15   = s:gray01
  let s:error = s:red01
  let s:warn  = s:red01
  let s:hint  = s:cyan01
  let s:info  = s:purple01
  let s:detach01  = s:neonyellow01
  let s:detach02  = s:neonblue01

  " let s:bg    = s:stratosphere16
  " let s:fg    = s:stratosphere03
  " let s:m01   = s:stratosphere15
  " let s:m02   = s:stratosphere14
  " let s:m03   = s:stratosphere12
  " let s:m04   = s:stratosphere10
  " let s:m05   = s:stratosphere09
  " let s:m06   = s:stratosphere08
  " let s:m07   = s:stratosphere07
  " let s:m08   = s:stratosphere06
  " let s:m09   = s:stratosphere05
  " let s:m10   = s:stratosphere04
  " let s:m11   = s:stratosphere03
  " let s:m12   = s:stratosphere02
  " let s:m13   = s:fg
  " let s:m14   = s:stratosphere02
  " let s:m15   = s:stratosphere01
  " let s:error = s:red01
  " let s:warn  = s:red01
  " let s:hint  = s:cyan01
  " let s:info  = s:purple01
  " let s:detach01  = s:neonyellow01
  " let s:detach02  = s:neonblue01
else
  let s:bg    = s:gray01
  let s:fg    = s:gray14
  let s:m01   = s:gray02
  let s:m02   = s:gray04
  let s:m03   = s:gray06
  let s:m04   = s:gray08
  let s:m05   = s:gray10
  let s:m06   = s:gray11
  let s:m07   = s:gray12
  let s:m08   = s:gray13
  let s:m09   = s:gray14
  let s:m10   = s:gray15
  let s:m11   = s:gray16
  let s:m12   = s:gray17
  let s:m13   = s:fg
  let s:m14   = s:gray19
  let s:m15   = s:gray20
  let s:error = s:red01
  let s:warn  = s:yellow01
  let s:hint  = s:cyan01
  let s:info  = s:purple01
  let s:detach01  = s:purple01
  let s:detach02  = s:blue01
endif

if has("nvim")
  let g:terminal_color_0 = s:m01[0]
  let g:terminal_color_1 = s:m06[0]
  let g:terminal_color_2 = s:m03[0]
  let g:terminal_color_3 = s:m11[0]
  let g:terminal_color_4 = s:m02[0]
  let g:terminal_color_5 = s:m08[0]
  let g:terminal_color_6 = s:m09[0]
  let g:terminal_color_7 = s:m13[0]
  let g:terminal_color_8 = s:m03[0]
  let g:terminal_color_9 = s:m10[0]
  let g:terminal_color_10 = s:m07[0]
  let g:terminal_color_11 = s:m15[0]
  let g:terminal_color_12 = s:m05[0]
  let g:terminal_color_13 = s:m12[0]
  let g:terminal_color_14 = s:m14[0]
  let g:terminal_color_15 = s:white[0]
elseif has("terminal")
  let g:terminal_ansi_colors = [
        \ s:m01[0],
        \ s:m06[0],
        \ s:m03[0],
        \ s:m11[0],
        \ s:m02[0],
        \ s:m08[0],
        \ s:m09[0],
        \ s:m13[0],
        \ s:m03[0],
        \ s:m10[0],
        \ s:m07[0],
        \ s:m15[0],
        \ s:m05[0],
        \ s:m12[0],
        \ s:m14[0],
        \ s:white[0]
        \ ]
endif

"## Defs
" call s:hi('Normal', s:fg, s:bg, '')
hi! Normal guibg=NONE ctermbg=NONE

call s:hi('Constant', s:m05, '', 'bold')
call s:hi('String', s:m10, '', '')
call s:hi('Number', s:m06, '', '')

call s:hi('Identifier', s:m08, '', '')
call s:hi('Function', s:m08, '', '')

call s:hi('Statement', s:m05, '', 'bold')
call s:hi('Operator', s:m05, '', '')
call s:hi('Keyword', s:m05, '', '')

call s:hi('PreProc', s:m07, '', '')

call s:hi('Type', s:m05, '', 'bold')

call s:hi('Special', s:m05, '', '')
call s:hi('SpecialComment', s:m03, '', 'bold')

call s:hi('Title', s:m07, '', 'bold')
call s:hi('Todo', s:purple01, '', 'bold')
if has("nvim") || has("gui_running")
  call s:hi('Comment', s:m03, '', 'italic')
else
  call s:hi('Comment', s:m03, '', '')
endif

call s:hi('LineNr', s:m05, '', '')
call s:hi('FoldColumn', s:m07, s:m01, '')
call s:hi('CursorLine', '', s:m01, '')
call s:hi('CursorLineNr', s:m14, s:m01, '')

call s:hi('Visual', s:bg, s:m06, '')
call s:hi('Search', s:m01, s:m07, '')
call s:hi('IncSearch', s:m01, s:m07, '')

call s:hi('SpellBad', '', '', 'undercurl')
call s:hi('SpellCap', s:red01, '', 'undercurl')
call s:hi('SpellLocal', s:red01, '', 'undercurl')
call s:hi('SpellRare', s:yellow01, '', 'undercurl')

call s:hi('Error', s:error, '', 'bold')
call s:hi('ErrorMsg', s:error, '', '')
call s:hi('Warning', s:warn, '', '')
call s:hi('WarningMsg', s:warn, '', '')
call s:hi('Hint', s:hint, '', '')
call s:hi('HintMsg', s:hint, '', '')
call s:hi('Info', s:info, '', '')
call s:hi('InfoMsg', s:info, '', '')
call s:hi('ModeMsg', s:m10, '', '')
call s:hi('MoreMsg', s:m10, '', '')

call s:hi('MatchParen', s:blue02, '', '')

call s:hi('Cursor', s:bg, s:rosequartz, '')
call s:hi('Underlined', s:m08, '', 'underline')
call s:hi('SpecialKey', s:m04, '', '')
call s:hi('NonText', s:m04, '', '')
call s:hi('Directory', s:m08, '', '')

call s:hi('Pmenu', s:m10, s:m03, '')
call s:hi('PmenuSbar', s:bg, s:m15, '')
call s:hi('PmenuSel', s:m03, s:m10, '')
call s:hi('PmenuThumb', s:m03, s:m09, '')

call s:hi('StatusLineNC', s:m04, s:m01, '')
if &background == 'dark'
  call s:hi('StatusLine', s:bg, s:serenity, '')
else
  call s:hi('StatusLine', s:fg, s:serenity, '')
endif

if has('nvim')
  call s:hi('WinSeparator', '', '', '')
endif

call s:hi('WildMenu', s:m08, '', '')
call s:hi('VertSplit', s:m03, s:m03, '')

call s:hi('DiffAdd', s:black, s:green01, '')
call s:hi('DiffChange', s:black, s:blue02, '')
call s:hi('DiffDelete', s:black, s:red01, '')
call s:hi('DiffText', s:bg, s:blue01, '')
call s:hi('DiffAdded', s:green01, '', '')
call s:hi('DiffChanged', s:blue02, '', '')
call s:hi('DiffRemoved', s:red01, '', '')

"## Links
hi! link Character Constant
hi! link Float Number
hi! link Boolean Number

hi! link SignColumn FoldColumn
hi! link ColorColumn FoldColumn
hi! link CursorColumn CursorLine

hi! link Folded Normal
hi! link Conceal Normal
hi! link ErrorMsg Error

hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement

hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link Debug Special
hi! link Question Special

hi! link VisualNOS Visual
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine

hi! link typescriptDOMDocProp typescriptProp
hi! link typescriptPaymentShippingOptionProp typescriptProp
hi! link typescriptPaymentMethod typescriptProp
hi! link typescriptDOMEventProp typescriptProp

hi! link gitcommitSummary gitcommitFirstLine

"## Plugins
call s:hi('QuickScopePrimary', s:detach01, '', '')
call s:hi('QuickScopeSecondary', s:detach02, '', '')

call s:hi('TelescopeSelection', '', s:m01, '')
hi! link TelescopeMatching QuickScopePrimary

hi! link DiagnosticError Error
hi! link DiagnosticHint Todo
