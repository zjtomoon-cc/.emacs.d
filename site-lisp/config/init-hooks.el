;; (advice-add 'awesome-tray-update :after '(lambda () (hide-mode-line-mode t)))

(add-hook 'prog-mode-hook
	  (lambda ()
	    (goggles-mode)))


(add-hook 'after-init-hook #'(lambda ()
			     (savehist-mode t)
			     (winner-mode t)
			     (global-auto-revert-mode t)
			     (global-hl-todo-mode t)
			     ))


(with-eval-after-load "prog-mode" (save-place-mode t))

;; (add-hook 'Info-mode-hook #'Info-persist-history-mode)


(provide 'init-hooks)
