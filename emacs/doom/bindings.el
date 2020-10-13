;;; binding.el -*- lexical-binding: t; -*-
;(global-set-key (kbd "C-,") 'execute-extended-command)

; THANKS: https://www.reddit.com/r/emacs/comments/2jzkz7/quickly_switch_to_previous_buffer/clgi1t7?utm_source=share&utm_medium=web2x&context=3
(defun switch-to-last-buffer ()
  (interactive)
  (switch-to-buffer nil))

(map! :n
      ;":" #'execute-extended-command
      "#" #'switch-to-last-buffer)

(map! :leader
      :desc "Close all others windows" "d s" #'delete-other-windows
      :desc "Close buffer" "d f" #'kill-buffer-and-window
      :desc "Find file" "f" #'+ivy/projectile-find-file
      :desc "execute" ";" #'execute-extended-command
      :desc "Save" "SPC" #'save-buffer)

(setq evil-escape-key-sequence "kj")
