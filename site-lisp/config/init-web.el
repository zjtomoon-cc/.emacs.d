(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(setq web-mode-part-padding 2
      web-mode-block-padding 2
      web-mode-script-padding 2)
(provide 'init-web)
