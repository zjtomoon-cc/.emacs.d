
(defun +evan/lsp-mode-setup-completion ()
  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
        '(orderless)))

(defun +evan/orderless-dispatch-flex-first (_pattern index _total)
   (and (eq index 0) 'orderless-flex))

(dolist (hook (list 'web-mode-hook 'typescript-mode-hook 'typescript-ts-mode-hook 'typescript-tsx-mode-hook 'go-ts-mode-hook 'dart-mode-hook))
  (add-hook hook 'lsp-deferred))

(setq flycheck-check-syntax-automatically '(save))

(eval-after-load "lsp-dart" (progn
			      (setq lsp-dart-outline t
				    lsp-dart-flutter-outline t
				    lsp-dart-show-outline t
				    lsp-dart-show-flutter-outline t)))

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp-deferred))))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix ""
	lsp-headerline-breadcrumb-segments '(symbols))

  ;; feature enable
  (setq lsp-enable-links nil
	lsp-enable-indentation nil
	lsp-enable-on-type-formatting nil
	lsp-enable-relative-indentation nil
	lsp-headerline-breadcrumb-enable nil
	lsp-inlay-hint-enable nil
	lsp-log-io nil
	lsp-lens-enable nil)
  ;; lsp fancy features
  (setq
   ;; ui
   lsp-progress-via-spinner nil
   ;; completion
   lsp-completion-show-detail t
   lsp-completion-show-kind t
   lsp-completion-use-last-result t
   ;; headerline
   lsp-headerline-breadcrumb-enable-symbol-numbers t
   ;; signature
   lsp-signature-doc-lines 10
   )
  ;; lsp server config
  (setq tab-always-indent 'complete)
  (setq lsp-response-timeout 1)
  :custom
  (lsp-completion-provider :none)
  :hook ((lsp-completion-mode . +evan/lsp-mode-setup-completion)
	 (lsp-managed-mode . yas-minor-mode)
	 (lsp-managed-mode . flycheck-mode))
  :config
  (add-hook 'orderless-style-dispatchers #'+evan/orderless-dispatch-flex-first nil 'local)
  ;; (require 'lsp-unocss)
  )


(provide 'init-lsp)
