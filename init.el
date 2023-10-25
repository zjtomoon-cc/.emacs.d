(require 'init-config)

;; start emacs app with zsh path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; use evil mode
(require 'evil)
;;(evil-mode 1)
