(require 'init-config)

;; start emacs app with zsh path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
