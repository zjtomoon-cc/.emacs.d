;; (require 'init-hide-mode-line)
;; (require 'doom-modeline)
;; (doom-modeline-mode t)
;; (require 'init-awesome-tray)

(when (display-graphic-p)
  (enable-theme +evan-theme)
  (+evan/set-fonts))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(defun +evan/toggle-big-font ()
  "切换大字体模式"
  (interactive)
  (if (> +evan/font-size 17.5)
      (setq +evan/font-size (- +evan/font-size 5)
	    +evan/cn-font-size (- +evan/cn-font-size 5))
    (setq +evan/font-size (+ +evan/font-size 5)
	  +evan/cn-font-size (+ +evan/cn-font-size 5)))
  (+evan/set-fonts)
  (+evan/set-cn-fonts))

(add-hook 'server-after-make-frame-hook
	  (lambda ()
	    (enable-theme +evan-theme)
	    (+evan/set-fonts)
	    (toggle-frame-fullscreen)))

(add-hook 'window-setup-hook
	  (lambda ()
	    (setq pixel-scroll-precision-interpolate-page t
		  pixel-scroll-precision-interpolation-between-scroll 0)
	    (pixel-scroll-mode t)
	    (pixel-scroll-precision-mode 1)))

(defalias 'scroll-up-command 'pixel-scroll-interpolate-down)
(defalias 'scroll-down-command 'pixel-scroll-interpolate-up)



(provide 'init-ui)
