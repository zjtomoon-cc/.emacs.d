(require 'dashboard)
(setq dashboard-items '((recents . 5) (projects . 5)))
(setq dashboard-projects-backend 'project-el
      dashboard-center-content t
      dashboard-show-shortcuts nil
      dashboard-set-init-info t
      dashboard-banner-logo-title "Ko No Dio Daaa!~"
      dashboard-startup-banner (expand-file-name "site-lisp/fuck.txt" user-emacs-directory)
      )
(dashboard-setup-startup-hook)

(provide 'init-dashboard)
