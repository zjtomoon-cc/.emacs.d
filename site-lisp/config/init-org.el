(require 'org)
(require 'org-modern)
(require 'init-valign)
(require 'init-org-agenda)
(require 'init-org-capture)

(setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "KILL(k)")))

(let ((faces '(("TODO" . (:foreground "#fbf7f0" :background "#006800"))
	       ("WAIT" . (:foreground "#fbf7f0" :background "#f5d0a0"))
	       ("DONE" . (:foreground "black" :background "gray90"))
	       ("KILL" . (:foreground "#fbf7f0" :background "#a60000")))))
  (setq org-modern-todo-faces faces)
  (setq org-todo-keyword-faces faces))


(autoload '+evan/setup-org-capture "init-org-capture")
(autoload '+evan/setup-org-agenda "init-org-agenda")
(add-hook 'org-mode-hook
	  (lambda ()
	    (global-org-modern-mode +1)))

(+evan/setup-org-agenda)
(+evan/setup-org-capture)

(provide 'init-org)
