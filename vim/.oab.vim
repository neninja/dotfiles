command OABTips e ~/dev/tips.txt
command OABPauta e ~/dev/pauta-reuniao.txt
command! OpenInVSCode exe '!code --goto "' . expand("%") . ':' . line(".") . ':' . col(".") . '"' | redraw!

let g:startify_bookmarks += [
		  \ {'c': 'C:\HashiCorp\Phalcon4-PHP7-Ubuntu\SGI'},
		  \ {'g': '~/dev/gitionario'},
		  \ ]