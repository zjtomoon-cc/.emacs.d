(setq package-enable-at-startup nil)

(require 'borg)
(setq borg-rewrite-urls-alist
      '(("git@github.com:" . "https://github.com/")))

(setq borg-user-emacs-directory user-emacs-directory)

(borg-initialize)

;; epkg
(setq epkg-repository "~/.emacs.d/epkgs")
(autoload 'epkg-describe-package "epkg" nil t)
(autoload 'epkg-find-file "epkg" nil t)
(autoload 'epkg-list-packages "epkg" nil t)
(autoload 'epkg-update "epkg" nil t)

;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(provide 'init-pkgm)
