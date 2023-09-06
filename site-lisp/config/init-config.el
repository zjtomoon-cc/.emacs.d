;; 打开emacs后必须立l刻使用的
(require 'init-func)
(require 'init-ui)
(require 'init-mode)
(require 'init-hooks)
(require 'init-one-key)
;; (require 'init-dired)
(require 'init-ediff)
(require 'init-treesit)
(require 'init-rime)
(require 'init-key)
(require 'init-window)
(require 'init-helpful)
(require 'init-xref)
(require 'init-auto-save)
(require 'init-translate)

;; (when (display-graphic-p)
;;   (enable-theme +evan-theme)
;;   (+evan/set-fonts))

(add-hook 'server-after-make-frame-hook
	  (lambda ()
	    (enable-theme +evan-theme)
	    (+evan/set-fonts)))

(add-hook 'window-setup-hook
	  (lambda ()
	    (require 'init-flycheck)
	    ;; (require 'init-eglot)
	    (require 'init-lsp)
	    ;; (require 'init-lsp-bridge)
	    (require 'init-corfu)
	    (require 'init-minibuffer-completion)
	    (require 'init-meow)
	    (require 'init-elfeed)
	    (goggles-mode t)))


;; 启动1s后再开启gc管理
(run-with-idle-timer 1 0 (lambda ()
			   (require 'init-gcmh)))

;;(benchmark-init/deactivate)

(provide 'init-config)
