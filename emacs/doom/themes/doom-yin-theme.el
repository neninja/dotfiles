;;; doom-yin-theme.el --- credits for yin yang vim theme -*- no-byte-compile: t; -*-
;; src code from doom-one-theme
(require 'doom-themes)

(defgroup doom-yin-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(def-doom-theme doom-yin
  "A monochrome theme by yin yang vim"
  ; https://github.com/pgdouyon/vim-yin-yang

  (;name        default     256     16
   (blackest    '("#080808"  "232",    nil         ))
   (black       '("#1c1c1c"  "234",    nil         ))
   (gray01      '("#262626"  "235",    nil         ))
   (gray02      '("#444444"  "238",    nil         ))
   (gray03      '("#4e4e4e"  "239",    nil         ))
   (gray04      '("#585858"  "240",    nil         ))
   (gray05      '("#666666"  "242",    nil         ))
   (gray06      '("#767676"  "243",    nil         ))
   (gray07      '("#808080"  "244",    nil         ))
   (gray08      '("#8a8a8a"  "245",    nil         ))
   (gray09      '("#949494"  "246",    nil         ))
   (gray10      '("#9e9e9e"  "247",    nil         ))
   (gray11      '("#a8a8a8"  "248",    nil         ))
   (gray12      '("#b2b2b2"  "249",    nil         ))
   (gray13      '("#bcbcbc"  "250",    nil         ))
   (gray14      '("#c6c6c6"  "251",    nil         ))
   (gray15      '("#e4e4e4"  "254",    nil         ))
   (white       '("#eeeeee"  "255",    nil         ))
   (purple      '("#5f5fd7"  "62",     nil         ))
   (brown       '("#875f00"  "94",     nil         ))
   (blue        '("#005f87"  "24",     nil         ))
   (lightblue   '("#00afff"  "31",     nil         ))
   (green       '("#00875f"  "29",     nil         ))
   (red         '("#d40000"  "88",     nil         ))
   (magenta     '("#87005f"  "89",     nil         ))
   (grey        gray01)
   (orange      brown)
   (teal        green)
   (yellow      brown)
   (dark-blue   blue)
   (violet      purple)
   (cyan        blue)
   (dark-cyan   blue)

   ;; complementos
   (base0       black) ; match parent
   (base1       blackest)
   (base2       blackest)
   (base3       blackest)
   (base4       purple)
   (base5       gray04) ; line nr
   (base6       purple)
   (base7       purple)
   (base8       purple)
   (bg          black)
   (fg          gray13)
   (bg-alt      black)
   (fg-alt      gray13)

   ;; face categories -- required for all themes
   (highlight      purple)
   (vertical-bar   gray03)
   (selection      blue)
   (builtin        gray08)
   (comments       gray03)
   (doc-comments   gray03)
   (constants      gray05)
   (functions      gray08)
   (keywords       gray04)
   (methods        gray08)
   (operators      gray05)
   (type           gray05)
   (strings        gray10)
   (variables      gray08)
   (numbers        gray06)
   (region         (doom-lighten bg 0.1))
   (error          red)
   (warning        brown)
   (success        green)
   (vc-modified    brown)
   (vc-added       green)
   (vc-deleted     red)
   )

;   ;; custom categories
;   (hidden     `(,(car bg) "black" "black"))

;   (modeline-fg     gray10)
;   (modeline-fg-alt gray11)
;
;   (modeline-bg     gray03)
;
;   (modeline-bg-l gray04)
;   (modeline-bg-inactive   red)
;   (modeline-bg-inactive-l blue)

  ;; --- extra faces ------------------------
    (
     ;; ivy-mode
     (ivy-minibuffer-match-highlight :background region)
     (ivy-current-match :background region)
     (ivy-minibuffer-match-face-1 :background nil :foreground blue)
     (ivy-minibuffer-match-face-2 :inherit 'ivy-minibuffer-match-face-1)
     (ivy-minibuffer-match-face-3 :inherit 'ivy-minibuffer-match-face-1)
     (ivy-minibuffer-match-face-4 :inherit 'ivy-minibuffer-match-face-1)

     ;; evil
     (evil-ex-search :background fg :foreground bg)
     (evil-ex-lazy-highlight :background fg :foreground bg)

     )

)
;;; doom-yin-theme.el ends here
