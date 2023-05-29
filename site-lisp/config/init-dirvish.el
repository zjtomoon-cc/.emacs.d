(require 'dirvish)
(require 'dirvish-side)
(dirvish-override-dired-mode)

(defun +evan/dirvish-side-current-path ()
  (interactive)
  (dirvish-side ))

(add-hook 'dirvish-side-follow-mode-hook (lambda () (display-line-numbers-mode -1)))
(provide 'init-dirvish)
