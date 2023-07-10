;; 保存desktop
(setq desktop-save t
      desktop-auto-save-timeout 5)
(savehist-mode t)
(desktop-save-mode 1)

(desktop-file-name "~/.emacs.d/desktop/.emacs.desktop"
		   "~/.emacs.d/desktop")

(defun +evan/read-dekstop ()
  (interactive)
  (desktop-read "~/.emacs.d/desktop/.emacs.desktop"))

(provide 'init-session)
