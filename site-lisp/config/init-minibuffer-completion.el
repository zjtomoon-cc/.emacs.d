(require 'vertico)
;; (require 'vertico-grid)
;; (require 'vertico-quick)
(require 'marginalia)
(require 'consult)
(require 'consult-xref)
(require 'wgrep)
;; (require 'consult-fzf)
(require 'init-orderless)

(vertico-mode 1)
(setq vertico-count 20
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

;; 允许vertico在minibuffer内补全
(setq completion-in-region-function
      (lambda (&rest args)
	(apply (if vertico-mode
		   #'consult-completion-in-region
		 #'completion--in-region)
	       args)))

(lazy-load-local-keys '(("C-DEL" . vertico-directory-delete-word)
			("DEL" . vertico-directory-delete-char))
		      vertico-map
		      "vertico-directory")

(keymap-set vertico-map "?" #'minibuffer-completion-help)
(keymap-set vertico-map "M-RET" #'minibuffer-force-complete-and-exit)
(keymap-set vertico-map "M-TAB" #'minibuffer-complete)
(add-hook 'rfn-eshadow-update-overlay #'vertico-directory-tidy)

(keymap-set minibuffer-local-map "M-s" #'consullt-history)
(keymap-set minibuffer-local-map "M-r" #'consult-history)
;; (add-hook 'minibuffer-mode-hook (lambda () (vertico-mode 1)))
(marginalia-mode)

(provide 'init-minibuffer-completion)
