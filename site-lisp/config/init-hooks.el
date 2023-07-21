;; (advice-add 'awesome-tray-update :after '(lambda () (hide-mode-line-mode t)))

(add-hook 'prog-mode-hook
	  (lambda ()
	    (goggles-mode)))

(add-hook 'after-init-hook #'(lambda ()
			     (savehist-mode t)
			     (winner-mode t)
			     (global-auto-revert-mode t)
			     (global-hl-todo-mode t)))


(add-hook 'prog-mode-hook
	  #'(lambda () (save-place-mode t)))

(provide 'init-hooks)
