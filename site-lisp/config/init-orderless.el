(require 'orderless)

(setq completion-styles '(orderless flex basic)
      completion-category-overrides
      `((file (;; styles
	       basic
		      ;; partial-completion
		      ))
	(eglot (styles ,@completion-styles))))

(provide 'init-orderless)
