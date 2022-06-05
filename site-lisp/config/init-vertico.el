(require 'vertico)
(require 'vertico-directory)
(setq vertico-resize nil
      vertico-count 18
      vertico-cycle t)

(vertico-mode)
(lazy-load-set-keys '(("DEL" . vertico-directory-delete-char)) vertico-map)


(require 'consult-dir)

(require 'consult)

(require 'marginalia)

(lazy-load-set-keys '(("M-A" . marginalia-cycle))
		    minibuffer-local-map)

(provide 'init-vertico)
