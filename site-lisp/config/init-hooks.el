(advice-add 'awesome-tray-update :after '(lambda () (hide-mode-line-mode t)))

(add-hook 'prog-mode-hook #'goggles-mode)

(add-hook 'after-init-hook (lambda ()
			     (setq-default recentf-max-saved-items 1000)
			     (savehist-mode t)
			     (save-place-mode t)
			     (winner-mode t)
			     (global-auto-revert-mode t)
			     (global-hl-todo-mode t)
			     (auto-save-mode t)))

(add-hook 'Info-mode-hook #'Info-persist-history-mode)


(provide 'init-hooks)
