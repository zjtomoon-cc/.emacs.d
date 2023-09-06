;; (require 'init-hide-mode-line)
;; (require 'doom-modeline)
;; (doom-modeline-mode t)
;; (require 'init-awesome-tray)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(toggle-frame-fullscreen)

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


(setq pixel-scroll-precision-interpolate-page t
      pixel-scroll-precision-interpolation-between-scroll 0)

(pixel-scroll-mode t)
(pixel-scroll-precision-mode 1)

;; (defun +pixel-scroll-interpolate-down (&optional lines)
;;   (interactive)
;;   (if lines
;;       (pixel-scroll-precision-interpolate (* -1 lines (pixel-line-height)))
;;     (pixel-scroll-interpolate-down)))

;; (defun +pixel-scroll-interpolate-up (&optional lines)
;;   (interactive)
;;   (if lines
;;       (pixel-scroll-precision-interpolate (* lines (pixel-line-height))))
;;   (pixel-scroll-interpolate-up))


(defalias 'scroll-up-command 'pixel-scroll-interpolate-down)
(defalias 'scroll-down-command 'pixel-scroll-interpolate-up)

(provide 'init-ui)
