(require 'apheleia)
(apheleia-global-mode +1)

(add-to-list 'apheleia-mode-alist '(typescript-ts-mode . prettier-typescript))
(add-to-list 'apheleia-mode-alist '(js-json-mode . prettier-json))
(add-to-list 'apheleia-mode-alist '(python . black))
;; (setf (alist-get 'prettier apheleia-formatters)
;;       '("prettier" "--stdin-filepath"  "| cat" buffer-file-name))
(provide 'init-apheleia)
