(require 'with-editor)
(require 'magit)
(require 'magit-section)
(require 'transient)
(setq magit-diff-refine-hunk t)
(setq magit-log-margin-show-committer-date t)
(setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)

(define-key magit-mode-map (kbd "C-M-k") #'magit-discard)

(magit-add-section-hook 'magit-status-sections-hook
			;; 'magit-insert-modules
			'magit-insert-stashes
			'magit-insert-tracked-files
			nil
			'append)

(defun my-magit-show-commit-advice (_)
    (cl-destructuring-bind (rev &optional args files module) _
      (list rev (cons "--diff-merges=on" args) files module)))

(advice-add 'magit-show-commit :filter-args 'my-magit-show-commit-advice)

(defun +evan/git-describe ()
  (interactive)
  (let ((result (string-trim (shell-command-to-string "git describe --match 'v[0-9]*' --dirty='.m' --always --tags --abbrev=8"))))
    (kill-new result)))

(eval-after-load 'git-link
  (lambda ()
    ;; git link for gitee support
    (add-to-list 'git-link-remote-alist '("gitee\\.com" git-link-github))))

(provide 'init-magit)
