(require 'go-translate)
(setq gts-translate-list '(("en" "zh")))
(setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-google-engine))
       :render (gts-buffer-render)))

(provide 'init-go-translate)
