(defun +evan/lsp-mode-setup-completion ()
  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
        '(orderless)))

(defun +evan/orderless-dispatch-flex-first (_pattern index _total)
  (and (eq index 0) 'orderless-flex))

(dolist (hook (list 'web-mode-hook 'typescript-mode-hook 'typescript-ts-mode-hook 'typescript-tsx-mode-hook 'go-ts-mode-hook 'dart-mode-hook))
  (add-hook hook 'lsp-deferred))

(setq flycheck-check-syntax-automatically '(save))

;; (eval-after-load "lsp-dart" (progn
;; 			      (setq lsp-dart-outline t
;; 				    lsp-dart-flutter-outline t
;; 				    lsp-dart-show-outline t
;; 				    lsp-dart-show-flutter-outline t)))

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (require 'lsp-pyright)
;; 	    (lsp-deferred)))


;; js/ts inlayHint

;; (setq lsp-javascript-display-variable-type-hints t
;;       lsp-javascript-display-property-declaration-type-hints t
;;       lsp-javascript-display-parameter-name-hints-when-argument-matches-name t
;;       lsp-javascript-display-parameter-name-hints t
;;       lsp-javascript-display-parameter-type-hints t
;;       lsp-javascript-display-return-type-hints t
;;       lsp-javascript-display-enum-member-value-hints t
;;       lsp-javascript-display-variable-type-hints t
;;       lsp-javascript-display-property-declaration-type-hints t
;;       lsp-javascript-display-parameter-name-hints-when-argument-matches-name t
;;       lsp-javascript-display-parameter-name-hints t
;;       lsp-javascript-display-parameter-type-hints t
;;       lsp-javascript-display-return-type-hints t
;;       lsp-javascript-display-enum-member-value-hints  t
;;       )



(setq lsp-keymap-prefix ""
      lsp-headerline-breadcrumb-segments '(symbols))
;; feature enable
(setq
 lsp-enable-links nil
 lsp-enable-indentation nil
 lsp-enable-on-type-formatting nil
 lsp-enable-relative-indentation nil
 lsp-headerline-breadcrumb-enable nil
 lsp-inlay-hint-enable nil
 lsp-log-io nil
 lsp-lens-enable nil)

(setq lsp-disabled-clients '(lsp-emmet))

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
 lsp-signature-doc-lines 10)
;; lsp server config
(setq tab-always-indent 'complete)
(setq lsp-response-timeout 1)

(setq lsp-prefer-capf :none)

(add-hook 'lsp-managed-mode-hook
	  (lambda ()
	    ;; (yas-minor-mode)
	    (flycheck-mode)
	    (eldoc-box-hover-at-point-mode)))

(add-hook 'lsp-completion-mode-hook
	  #'+evan/lsp-mode-setup-completion)

(add-hook 'orderless-style-dispatchers #'+evan/orderless-dispatch-flex-first nil 'local)

(provide 'init-lsp)
