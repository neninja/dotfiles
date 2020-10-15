" VyinVang - black/white color scheme
" All credits of colors and algorithm Pierre-Guy Douyon
" THANKS: https://github.com/pgdouyon/vim-yin-yang

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "vang"

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
let s:white     = ['#f7f7f7', 254] 
let s:gray15    = ['#e4e4e4', 253]
let s:gray14    = ['#bcbcbc', 250]
let s:gray13    = ['#b2b2b2', 249]
let s:gray12    = ['#a8a8a8', 248]
let s:gray11    = ['#9e9e9e', 247]
let s:gray10    = ['#949494', 246]
let s:gray09    = ['#8a8a8a', 245]
let s:gray08    = ['#808080', 244]
let s:gray07    = ['#767676', 243]
let s:gray06    = ['#666666', 242]
let s:gray05    = ['#606060', 241]
let s:gray04    = ['#585858', 240]
let s:gray03    = ['#4e4e4e', 239]
let s:gray02    = ['#444444', 238]
let s:gray01    = ['#262626', 235]
let s:black     = ['#121212', 233]

let s:purple    = ['#875fd7', 98]
let s:brown     = ['#af5f00', 130]
let s:blue      = ['#5f87af', 67]
let s:darkblue  = ['#005fff', 27]
let s:green     = ['#5f875f', 65]
let s:red       = ['#870000', 88]
let s:magenta   = ['#af005f', 125]

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
    let g:terminal_color_11 = s:gray13[0]
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
                \ s:gray13[0],
                \ s:gray05[0],
                \ s:gray12[0],
                \ s:gray14[0],
                \ s:white[0]
                \ ]
endif

"## Defs
call s:hi('Normal', s:gray05, s:white, '')
set background=light

call s:hi('Constant', s:gray11, '', 'bold')
call s:hi('String', s:gray08, '', '')
call s:hi('Number', s:gray10, '', '')

call s:hi('Identifier', s:gray06, '', '')
call s:hi('Function', s:gray06, '', '')

call s:hi('Statement', s:gray08, '', 'bold')
call s:hi('Operator', s:gray03, '', '')
call s:hi('Keyword', s:gray10, '', '')

call s:hi('PreProc', s:gray10, '', '')

call s:hi('Type', s:gray09, '', 'bold')

call s:hi('Special', s:gray10, '', '')
call s:hi('SpecialComment', s:gray12, '', 'bold')

call s:hi('Title', s:gray10, '', 'bold')
call s:hi('Todo', s:purple, s:white, 'bold')
if has("nvim") || has("gui_running")
    call s:hi('Comment', s:gray12, '', 'italic')
else
    call s:hi('Comment', s:gray12, '', '')
endif

call s:hi('LineNr', s:gray13, '', '')
call s:hi('FoldColumn', s:gray08, s:gray15, '')
call s:hi('CursorLine', '', s:gray15, '')
call s:hi('CursorLineNr', s:gray06, s:gray15, '')

call s:hi('Visual', s:white, s:gray06, '')
call s:hi('Search', s:gray15, s:gray03, '')
call s:hi('IncSearch', s:white, s:gray11, 'bold')

call s:hi('SpellBad', s:red, s:white, 'undercurl')
call s:hi('SpellCap', s:red, s:white, 'undercurl')
call s:hi('SpellLocal', s:red, s:white, 'undercurl')
call s:hi('SpellRare', s:brown, s:white, 'undercurl')

call s:hi('Error', s:red, s:white, 'bold')
call s:hi('ErrorMsg', s:red, s:white, '')
call s:hi('WarningMsg', s:brown, s:white, '')
call s:hi('ModeMsg', s:gray10, '', '')
call s:hi('MoreMsg', s:gray10, '', '')

call s:hi('MatchParen', s:magenta, s:white, '')

call s:hi('Cursor', s:white, s:serenity, '')
call s:hi('Underlined', s:gray08, '', 'underline')
call s:hi('SpecialKey', s:gray13, '', '')
call s:hi('NonText', s:gray13, '', '')
call s:hi('Directory', s:gray08, '', '')

call s:hi('Pmenu', s:gray05, s:gray14, '')
call s:hi('PmenuSbar', s:white, s:gray01, '')
call s:hi('PmenuSel', s:gray14, s:gray05, '')
call s:hi('PmenuThumb', s:gray14, s:gray03, '')

call s:hi('StatusLine', s:gray03, s:rosequartz, '')
call s:hi('StatusLineNC', s:gray13, s:gray15, '')
call s:hi('WildMenu', s:gray08, '', '')
call s:hi('VertSplit', s:gray13, s:gray13, '')

call s:hi('DiffAdd', s:white, s:green, '')
call s:hi('DiffChange', s:white, s:blue, '')
call s:hi('DiffDelete', s:white, s:red, '')
call s:hi('DiffText', s:white, s:darkblue, '')
call s:hi('DiffAdded', s:green, s:white, '')
call s:hi('DiffChanged', s:blue, s:white, '')
call s:hi('DiffRemoved', s:red, s:white, '')

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
