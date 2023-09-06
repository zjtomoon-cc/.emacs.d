(require 'lsp-bridge)
(require 'yasnippet)
(require 'init-tempel)

(setq acm-enable-icon t
      acm-enable-doc nil
      acm-enable-yas t
      acm-enable-tempel nil
      acm-enable-quick-access nil
      acm-enable-search-file-words nil
      acm-enable-telega nil
      acm-enable-tabnine nil
      acm-enable-codeium nil
      lsp-bridge-enable-signature-help nil
      lsp-bridge-enable-hover-diagnostic t
      lsp-bridge-enable-diagnostics t
      lsp-bridge-enable-mode-line nil
      lsp-bridge-signature-show-function 'message
      lsp-bridge-signature-posframe-params  '(:poshandler posframe-poshandler-point-bottom-left-corner-upward :internal-border-width 1 :max-width 30 :max-height 12)
      lsp-bridge-lookup-doc-tooltip-max-width 60
      lsp-bridge-lookup-doc-tooltip-max-height 20
      lsp-bridge-diagnostic-tooltip-border-width 0
      )
(setq lsp-bridge-c-lsp-server "ccls")
(setq lsp-bridge-python-lsp-server "pyright")
(setq lsp-bridge-multi-lang-server-extension-list nil)
(setq lsp-bridge-single-lang-server-extension-list nil)

;; eglot开启的模式不要启动
;; (-each eglot-enable-modes
;;   (lambda (mode)
;;     (setq lsp-bridge-default-mode-hooks
;; 	  (-remove-item mode lsp-bridge-default-mode-hooks))))






(add-to-list 'lsp-bridge-single-lang-server-extension-list '(("tsx" "ts" ) . "typescript"))
(add-to-list 'lsp-bridge-single-lang-server-extension-list '(("vue") . "volar"))

(one-key-create-menu "Diagnostic"
		     '((("n" . "Next diagnostic") . lsp-bridge-diagnostic-jump-next)
		       (("p" . "Previous diagnostic") . lsp-bridge-diagnostic-jump-prev)
		       (("l" . "Show all diagnostic") . lsp-bridge-diagnostic-list)))


(defun lsp-bridge-toggle-debug ()
  (interactive)
  (setq lsp-bridge-enable-debug (not lsp-bridge-enable-debug)
	lsp-bridge-enable-log (not lsp-bridge-enable-log)))

(defun lsp-bridge-toggle-diagnostics ()
  (interactive)
  (setq-local lsp-bridge-enable-diagnostics (not lsp-bridge-enable-diagnostics))
  (message "lsp-bridge-enable-diagnostics: %s" lsp-bridge-enable-diagnostics))

(add-hook 'lsp-bridge-mode-hook '(lambda ()
				   (yas-minor-mode t)
				   (electric-pair-mode t)
				   (electric-quote-mode t)
				   (keymap-set lsp-bridge-mode-map "M-n" '("Scroll doc down" . lsp-bridge-popup-documentation-scroll-down))
				   (keymap-set lsp-bridge-mode-map "M-p" '("Scroll doc up" . lsp-bridge-popup-documentation-scroll-up))))

(call-interactively 'global-lsp-bridge-mode)
(provide 'init-lsp-bridge)
