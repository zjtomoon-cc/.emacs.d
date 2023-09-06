(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-inhibit-implied-resize t)
;; 增加IO性能
(setq read-process-output-max (* 1024 1024 10))
(setq gc-cons-threshold most-positive-fixnum)
(setq +evan-theme nil)
(find-function-setup-keys)

(let ((default-directory "~/.emacs.d/site-lisp")
      (file-name-handler-alist nil))
  ;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/pkg/benchmark-init"))
  ;; (require 'benchmark-init)
  ;; (benchmark-init/activate)
  (normal-top-level-add-subdirs-to-load-path)
  (require 'init-pkgm)
  (require 'init-better-default)
  (require 'lazy-load)
  (require 'one-key)
  (require 'init-themes)
  (require 'init-font)
  (require 'init-face)
  
  (setq +evan-theme (if (and (>= (string-to-number (format-time-string "%H")) 6)
			     (>= (string-to-number (format-time-string "%H")) 18))
			'spacemacs-light
		      'spacemacs-dark))
  (load-theme +evan-theme t nil))


