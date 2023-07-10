(dolist (hook '(dired-mode-hook dirvish-mode-hook))
  (add-hook hook (lambda ()
		   (setq dired-dwim-target t)
		   (keymap-set dired-mode-map "C-b" 'dired-up-directory)
		   (keymap-set dired-mode-map "C-f" 'dired-find-file)
		   (keymap-set dired-mode-map "x" 'dired-do-flagged-delete))))

(setq dired-listing-switches "-alh"
      dired-auto-revert-buffer t)

(provide 'init-dired)
