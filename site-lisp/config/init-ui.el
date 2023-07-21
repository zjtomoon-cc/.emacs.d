(require 'init-hide-mode-line)
;; (require 'doom-modeline)
;; (doom-modeline-mode t)
(require 'init-awesome-tray)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(toggle-frame-fullscreen)
;; (+evan/toggle-transparent)
;; (+evan/toggle-transparent)

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

(provide 'init-ui)
