
(dolist (hook (list
	       'emacs-lisp-mode-hook
	       'web-mode-hook))
  (add-hook hook #'(lambda ()
		     (require 'format-all)
		     (format-all-mode))))

(provide 'init-format-all)
