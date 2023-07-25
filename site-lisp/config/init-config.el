;; 打开emacs后必须立刻使用的
(require 'init-func)
(require 'init-ui)
(require 'init-mode)
(require 'init-hooks)
(require 'init-one-key)
(require 'init-dired)
(require 'init-ediff)
(require 'init-treesit)
(require 'init-rime)
(require 'init-key)
(require 'init-window)
(require 'init-helpful)
(require 'init-xref)
(require 'init-auto-save)
(require 'init-face)
(require 'init-translate)




(when (display-graphic-p)
  (require 'init-font)
  (+evan/set-fonts)
  (setq +evan-theme (if (and (>= (string-to-number (format-time-string "%H")) 6)
			       (>= (string-to-number (format-time-string "%H")) 18))
			  'doom-one
		      'doom-one-light))
  (load-theme +evan-theme t nil)
  (enable-theme +evan-theme))

(add-hook 'window-setup-hook
	  (lambda ()
	    (require 'init-flycheck)
	    (require 'init-lsp)
	    (require 'init-corfu)
	    (require 'init-minibuffer-completion)
	    (require 'init-meow)
	    (require 'init-elfeed)))



;; (require 'init-session)
;; (+evan/read-dekstop)

;; 启动1s后再开启gc管理
(run-with-idle-timer 1 0 (lambda ()
			   (require 'init-gcmh)))

;;(benchmark-init/deactivate)

(provide 'init-config)
