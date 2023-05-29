;; 窗口移动
(setq x-underline-at-descent-line t)
;; 窗口黄金比例
;; (require 'golden-ratio)
;; (golden-ratio-mode -1)
;; 绘制窗口线
(setq window-divider-default-places t
      window-divider-default-right-width 0
      window-divider-default-bottom-width 1)

(with-eval-after-load 'hide-mode-line (window-divider-mode))


;; (window-divider-mode nil)
(provide 'init-window)
