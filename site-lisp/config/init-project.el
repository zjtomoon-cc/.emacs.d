(require 'project)

(one-key-create-menu
 "Project"
 '(
   (("f" . "Find file in project") . project-find-file)
   (("a". "Remmeber a proejct") . project-remember-projects-under)
   (("p" . "Switch project") . project-switch-project)
   (("r" . "Remove known project") . project-forget-project)
   (("b" . "Project buffer") . consult-project-buffer)
   (("e" . "Project eat") . eat-project)))

(define-key project-prefix-map (kbd "b") #'+evan/project-blink-search)
(define-key project-prefix-map (kbd "m") #'+evan/project-magit)
(define-key project-prefix-map (kbd "d") #'+evan/project-dired)
(define-key project-prefix-map (kbd "f") #'project-find-file)
(define-key project-prefix-map (kbd "F") #'project-find-dir)
(define-key project-prefix-map (kbd "g") #'+evan/project-rg)
(define-key project-prefix-map (kbd "e") #'eat-project)

(setq project-switch-commands nil)
(add-to-list 'project-switch-commands '(+evan/project-blink-search "BlinkSearch") t)
(add-to-list 'project-switch-commands '(+evan/project-magit "Magit") t)
(add-to-list 'project-switch-commands '(+evan/project-dired "Dired") t)
(add-to-list 'project-switch-commands '(project-find-file "Find file") t)
(add-to-list 'project-switch-commands '(project-find-dir "Find dir") t)
(add-to-list 'project-switch-commands '(+evan/project-rg "Ripgrep") t)
(add-to-list 'project-switch-commands '(eat-project "Eat") t)



;;;###autoload
(defun +evan/project-rg ()
  (interactive)
  (let ((default-directory (project-root (project-current nil))))
    (consult-ripgrep default-directory)))

;;;###autoload
(defun +evan/project-magit ()
  (interactive)
  (magit (project-root (project-current nil))))

;;;###autoload
(defun +evan/project-dired ()
  (interactive)
  (let ((default-directory (project-root (project-current nil))))
    (dired default-directory)))

;;;###autoload
(defun +evan/project-blink-search ()
  (interactive)
  (let ((default-directory (project-root (project-current nil))))
    (blink-search)))


;;;###autoload
(defun +evan/project-recentf ()
  (interactive)
  (find-file (completing-read "Recentf in project"
		       (-filter (lambda (it)
				  (s-contains? (car (-take-last 1 (project-current))) it)) recentf-list)
		       )))

(provide 'init-project)
