" VyinVang - black/white color scheme
" All credits of colors and algorithm Pierre-Guy Douyon
" THANKS: https://github.com/pgdouyon/vim-yin-yang
"
" TOOLS:
"   https://www.colorhexa.com
"   https://jonasjacek.github.io/colors/

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "vyin"

function! s:hi(group, fg, bg, style)
    execute "hi ".a:group
                \." guifg="  .s:NONE(a:fg[0])." ctermfg=" .s:NONE(a:fg[1])
                \." guibg="  .s:NONE(a:bg[0])." ctermbg=" .s:NONE(a:bg[1])
                \." gui="    .s:NONE(a:style)." cterm="   .s:NONE(a:style)
endfunction

function! s:NONE(attr)
    return empty(a:attr) ? "NONE" : a:attr
endfunction

"## Colors
let s:blackest  = ['#080808', 232]
let s:black     = ['#1c1c1c', 234]
let s:gray01    = ['#262626', 235]
let s:gray02    = ['#444444', 238]
let s:gray03    = ['#4e4e4e', 239]
let s:gray04    = ['#585858', 240]
let s:gray05    = ['#666666', 242]
let s:gray06    = ['#767676', 243]
let s:gray07    = ['#808080', 244]
let s:gray08    = ['#8a8a8a', 245]
let s:gray09    = ['#949494', 246]
let s:gray10    = ['#9e9e9e', 247]
let s:gray11    = ['#a8a8a8', 248]
let s:gray12    = ['#b2b2b2', 249]
let s:gray13    = ['#bcbcbc', 250]
let s:gray14    = ['#c6c6c6', 251]
let s:gray15    = ['#e4e4e4', 254]
let s:white     = ['#eeeeee', 255]

let s:purple    = ['#5f5fd7', 62]
let s:brown     = ['#d79b5f', 94]
let s:blue      = ['#5f5fd7', 25]
let s:lightblue = ['#5f9bd7', 31]
let s:cyan      = ['#5fd7d7', 43]
let s:green     = ['#5fd75f', 29]
let s:red       = ['#df5757', 88]
let s:magenta   = ['#87005f', 89]
let s:yellow    = ['#d7d75f', 100]

" https://www.pantone.com/color-finder/13-1520-TCX
" PANTONE 13-1520 TCX - Rose Quartz
let s:rosequartz= ['#F7CACA', 133]

" https://www.pantone.com/color-finder/15-3919-TCX
" PANTONE 15-3919 TCX Serenity
let s:serenity  = ['#93A9D1', 67]

if has("nvim")
    let g:terminal_color_0 = s:gray01[0]
    let g:terminal_color_1 = s:gray06[0]
    let g:terminal_color_2 = s:gray03[0]
    let g:terminal_color_3 = s:gray11[0]
    let g:terminal_color_4 = s:gray02[0]
    let g:terminal_color_5 = s:gray08[0]
    let g:terminal_color_6 = s:gray09[0]
    let g:terminal_color_7 = s:gray13[0]
    let g:terminal_color_8 = s:gray03[0]
    let g:terminal_color_9 = s:gray10[0]
    let g:terminal_color_10 = s:gray07[0]
    let g:terminal_color_11 = s:gray15[0]
    let g:terminal_color_12 = s:gray05[0]
    let g:terminal_color_13 = s:gray12[0]
    let g:terminal_color_14 = s:gray14[0]
    let g:terminal_color_15 = s:white[0]
elseif has("terminal")
    let g:terminal_ansi_colors = [
                \ s:gray01[0],
                \ s:gray06[0],
                \ s:gray03[0],
                \ s:gray11[0],
                \ s:gray02[0],
                \ s:gray08[0],
                \ s:gray09[0],
                \ s:gray13[0],
                \ s:gray03[0],
                \ s:gray10[0],
                \ s:gray07[0],
                \ s:gray15[0],
                \ s:gray05[0],
                \ s:gray12[0],
                \ s:gray14[0],
                \ s:white[0]
                \ ]
endif

"## Defs
call s:hi('Normal', s:gray13, s:black, '')
set background=dark

call s:hi('Constant', s:gray05, '', 'bold')
call s:hi('String', s:gray10, '', '')
call s:hi('Number', s:gray06, '', '')

call s:hi('Identifier', s:gray08, '', '')
call s:hi('Function', s:gray08, '', '')

call s:hi('Statement', s:gray05, '', 'bold')
call s:hi('Operator', s:gray05, '', '')
call s:hi('Keyword', s:gray05, '', '')

call s:hi('PreProc', s:gray07, '', '')

call s:hi('Type', s:gray05, '', 'bold')

call s:hi('Special', s:gray05, '', '')
call s:hi('SpecialComment', s:gray03, '', 'bold')

call s:hi('Title', s:gray07, '', 'bold')
call s:hi('Todo', s:purple, s:black, 'bold')
if has("nvim") || has("gui_running")
    call s:hi('Comment', s:gray03, '', 'italic')
else
    call s:hi('Comment', s:gray03, '', '')
endif

call s:hi('LineNr', s:gray05, '', '')
call s:hi('FoldColumn', s:gray07, s:gray01, '')
call s:hi('CursorLine', '', s:gray01, '')
call s:hi('CursorLineNr', s:gray14, s:gray01, '')

call s:hi('Visual', s:black, s:gray06, '')
call s:hi('Search', s:gray01, s:gray07, '')
call s:hi('IncSearch', s:gray01, s:gray07, '')

call s:hi('SpellBad', '', s:black, 'undercurl')
call s:hi('SpellCap', s:red, s:black, 'undercurl')
call s:hi('SpellLocal', s:red, s:black, 'undercurl')
call s:hi('SpellRare', s:yellow, s:black, 'undercurl')

call s:hi('Error', s:red, s:black, 'bold')
call s:hi('ErrorMsg', s:red, s:black, '')
call s:hi('WarningMsg', s:yellow, s:black, '')
call s:hi('ModeMsg', s:gray10, '', '')
call s:hi('MoreMsg', s:gray10, '', '')

call s:hi('MatchParen', s:blue, '', '')

call s:hi('Cursor', s:black, s:rosequartz, '')
call s:hi('Underlined', s:gray08, '', 'underline')
call s:hi('SpecialKey', s:gray04, '', '')
call s:hi('NonText', s:gray04, '', '')
call s:hi('Directory', s:gray08, '', '')

call s:hi('Pmenu', s:gray10, s:gray03, '')
call s:hi('PmenuSbar', s:black, s:gray15, '')
call s:hi('PmenuSel', s:gray03, s:gray10, '')
call s:hi('PmenuThumb', s:gray03, s:gray09, '')

call s:hi('StatusLine', s:black, s:serenity, '')
call s:hi('StatusLineNC', s:gray04, s:gray01, '')
call s:hi('WildMenu', s:gray08, '', '')
call s:hi('VertSplit', s:gray03, s:gray03, '')

call s:hi('DiffAdd', s:blackest, s:green, '')
call s:hi('DiffChange', s:blackest, s:blue, '')
call s:hi('DiffDelete', s:blackest, s:red, '')
call s:hi('DiffText', s:black, s:lightblue, '')
call s:hi('DiffAdded', s:green, s:black, '')
call s:hi('DiffChanged', s:blue, s:black, '')
call s:hi('DiffRemoved', s:red, s:black, '')

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

"## Links
hi! link Character Constant
hi! link Float Number
hi! link Boolean Number

hi! link SignColumn FoldColumn
hi! link ColorColumn FoldColumn
hi! link CursorColumn CursorLine

hi! link Folded LineNr
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
