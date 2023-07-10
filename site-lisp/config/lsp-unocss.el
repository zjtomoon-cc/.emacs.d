;; custom language server
(add-to-list 'lsp-language-id-configuration '(web-mode . "unocss"))


(defun lsp-unocss--initialization-options ()
  "The unocss-language-server requires configuration not be null."
  (ht-merge (lsp-configuration-section "unocss")))

(lsp-dependency 'unocss-language-server
                '(:system "unocss-language-server")
                '(:npm :package "unocss-language-server" :path "unocss-language-server"))

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection
                   (lambda ()
                     `(,(lsp-package-path 'unocss-language-server) "--stdio")))
  :activation-fn (lambda (filename &optional _)
                   (string-match-p (rx (one-or-more anything) "."
                                       (or "tsx" "jsx" "vue") eos)
                                   filename))
  :initialization-options #'lsp-unocss--initialization-options
  :multi-root t
  :add-on? nil
  :server-id 'unocss))


(provide 'lsp-unocss)
