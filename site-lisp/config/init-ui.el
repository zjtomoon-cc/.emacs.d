(when (display-graphic-p)
  (enable-theme +evan-theme)
  ;; (cnfonts-mode 1)
  (+evan/set-fonts)
  (toggle-frame-fullscreen))

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

;; (add-to-list 'after-make-frame-functions
;; 	     (lambda (f)
;; 	       (enable-theme +evan-theme)
;; 	       (+evan/set-fonts)
;; 	       (+evan/toggle-transparent)
;; 	       ))

(add-hook 'window-setup-hook
	  (lambda ()
	    (setq pixel-scroll-precision-interpolate-page t
		  pixel-scroll-precision-interpolation-between-scroll 0)
	    (pixel-scroll-mode t)
	    (pixel-scroll-precision-mode 1)))

(defalias 'scroll-up-command 'pixel-scroll-interpolate-down)
(defalias 'scroll-down-command 'pixel-scroll-interpolate-up)


;; (add-hook 'prog-mode-hook #'breadcrumb-local-mode)

(provide 'init-ui)
