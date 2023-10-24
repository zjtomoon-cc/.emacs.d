;; auto run eglot hook
;; (dolist (hook (list 'web-mode-hook 'typescript-mode-hook 'typescript-ts-mode 'typescript-tsx-mode 'go-ts-mode-hook))
;;   (add-hook hook 'eglot-ensure))

(setq tab-always-indent 'complete)
(setq eglot-events-buffer-size nil)
(setq eglot-autoreconnect nil)
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))
(setq eglot-inlay-hints-mode nil)
(setq eglot-connect-timeout 20)


(dolist (hook (list 'web-mode-hook 'typescript-mode-hook 'typescript-ts-mode-hook 'typescript-tsx-mode-hook 'go-ts-mode-hook 'dart-mode-hook))
  (add-hook hook 'eglot-ensure))

;; hooks
(add-hook 'eglot-managed-mode-hook (lambda ()
				     (yas-minor-mode t)
				     ;; eldoc-box
				     (eldoc-box-hover-at-point-mode t)
				     ;; capf
				     (setq-local completion-at-point-functions
						 (list (cape-super-capf
							#'eglot-completion-at-point)))))


(with-eval-after-load 'eglot (progn
			       ;; (require 'yasnippet)
			       (require 'init-corfu)
			       (require 'eldoc-box)
			       (setq eldoc-idle-delay 1)))


;; server settings
(setq eglot-server-programs nil)

;; (add-to-list 'eglot-server-programs
;;              '((js-mode js-jsx-mode tsx-ts-mode typescript-mode typescript-ts-mode typescript-tsx-mode)
;;                .
;;                ("typescript-language-server" "--stdio"
;; 		:initializationOptions
;; 		(:preference
;; 		 (
;; 		  :includeCompletionsForModuleExports t))
;; 		)))

(add-to-list 'eglot-server-programs
	     '((go-ts-mode go-mode)
	       .
	       ("gopls" "-remote=auto")))

(add-to-list 'eglot-server-programs
	     '((rust-ts-mode rust-mode)
	       .
	       ("ust-analyzer"
		:initializationOptions
		(:cargo
		 (:features "all"
		  :noDefaultFeatures nil
		  :runBuildScriptsa t
		  :loadOutDirsFromCheck t
		  :useRustcWrapperForBuildScripts t
		  :autoreload t
		  :buildScripts t)
		 :procMacro t
		 )
		)))

(add-to-list 'eglot-server-programs
	     '((bash-ts-mode sh-mode)
	       .
	       ("bash-language-server" "start")))

(add-to-list 'eglot-server-programs
	     '((clojure-mode)
	       .
	       ("clojure-lsp" "listen")))

(add-to-list 'eglot-server-programs
	     '((python-ts-mode python-mode)
	       .
	       ("pyright-langserver" "--stdio")))

(add-to-list 'eglot-server-programs '(dart-mode . ("dart" "language-server")))
(add-to-list 'eglot-server-programs '(kotlin-mode . ("kotlin-language-server")))
(add-to-list 'eglot-server-programs
             '((web-mode typescript-ts-mode)
               .
               ("vue-language-server" "--stdio"
                :initializationOptions
		(:serverMode 0
			     :diagnosticModel 1
			     :textDocumentSync 2
			     :typescript (:tsdk "/usr/lib/node_modules/typescript/lib/"))
		)))

;; (add-hook 'web-mode-hook (lambda ()
;; 			   (setq-local eglot-workspace-configuration
;; 				       '(:emmet (:showExpandedAbbreviation "never")))))


(provide 'init-eglot)
