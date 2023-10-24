;; variables
(setq corfu-cycle t
      corfu-auto t
      ;; 键入空格也不要退出
      corfu-quit-at-boundary nil
      ;; 没有匹配项退出
      corfu-quit-no-match t
      corfu-preview-current t
      corfu-auto-prefix 1
      corfu-auto-delay 0.01
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
     )


;; autoload
;; (setq corfu-enable-mode-hooks '(eglot-managed-mode-hook text-mode-hook conf-mode-hook prog-mode-hook))

;; (dolist (hook corfu-enable-mode-hooks)
;;   (add-hook hook 'corfu-mode))

(global-corfu-mode t)

(autoload 'corfu-mode "corfu" nil nil)
(autoload 'corfu-history-mode "corfu-history" nil nil)

;; hooks
(add-hook 'corfu-mode-hook (lambda ()
			     (electric-pair-mode t)
			     (electric-quote-mode t)
			     (corfu-history-mode t)))

;; corfu extensions
(with-eval-after-load 'corfu (progn
			       (unless (display-graphic-p)
				 (corfu-terminal-mode +1))
			       (require 'init-tempel)
			       (require 'init-orderless)
			       (require 'corfu-info)
			       (require 'cape)
			       (require 'corfu-popupinfo)
			       (require 'kind-icon)
			       (lazy-load-set-keys '(("C-d" . corfu-doc-toggle)
						     ("C-S-p" . corfu-doc-scroll-down)
						     ("C-S-n" . corfu-doc-scroll-up)
						     ("ESC" . corfu-quit)
						     ([tab] . corfu-next)
						     ("C-n" . corfu-next)
						     ("C-p" . corfu-previous)
						     ([backtab] . corfu-previous)
						     ("M-<backspace>". (lambda ()
									 (interactive)
									 (corfu-quit)
									 (call-interactively 'backward-kill-word))))
						   corfu-map)

			       (add-hook 'meow-insert-exit-hook #'(lambda ()
								    (message "quit")
								    (corfu-quit)))			       
			       ))
(with-eval-after-load 'corfu-history (progn
				       (add-to-list 'savehist-additional-variables 'corfu-history)))
;; cape
(with-eval-after-load 'cape (progn
			      (require 'cape-keyword)
			      (setq cape-dict-file
				    (expand-file-name "site-lisp/dict/words" user-emacs-directory))
			      (add-hook 'protobuf-ts-mode-hook (lambda () (setq-local completion-at-point-functions #'cape-dabbrev)))
			      (add-hook 'thrift-mode-hook (lambda () (setq-local completion-at-point-functions #'cape-dabbrev)))
			      

			      (add-hook 'text-mode-hook (lambda ()
							  (setq-local completion-at-point-functions (list (cape-super-capf
													   #'cape-dict
													   #'cape-dabbrev
													   )))))
			      (dolist (hook '(prog-mode-hook))
				(add-hook hook (lambda ()
						 (setq-local completion-at-point-functions
							     (list (cape-super-capf
								    #'cape-file
								    ;; #'cape-yasnippet
								    #'cape-history
								    #'cape-keyword
								    #'cape-symbol
								    #'cape-dict))))))))



(defun +toggle/cape-dict ()
  (interactive)
  (require 'dash)
  (if (--find (eq it 'cape-dict) completion-at-point-functions)
      (setq-local completion-at-point-functions (-remove-item 'cape-dict completion-at-point-functions))
    (add-to-list 'completion-at-point-functions 'cape-dict t)))

;; kind-icon
(with-eval-after-load 'kind-icon (progn
				   (setq kind-icon-default-face 'corfu-default)
				   (setq kind-icon-use-icons t)
				   (add-to-list 'kind-icon-mapping '(EnumMember "em" :icon "format-list-checks" :face font-lock-builtin-face))
				   (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)))


(provide 'init-corfu)
