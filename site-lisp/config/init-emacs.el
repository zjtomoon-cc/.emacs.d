;;;###autoload
(defun +evan/find-emacs-config()
  (interactive)
  (consult-find (expand-file-name "~/.emacs.d/")))
;;;###autoload
(defun +clean-theme()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))
(provide 'init-emacs)
