(setq initial-buffer-choice t)
;; (add-hook 'emacs-startup-hook (lambda () (run-with-timer 0 0 (lambda () (call-interactively 'writeroom-mode)))))
(setq user-full-name "Evan Meek")       ;设置用户名
(setq user-mail-address
      "the_lty_mail@foxmail.com") 	;设置邮箱
(setq use-dialog-box nil)               ;never pop dialog
(setq ring-bell-function 'ignore)       ;关闭烦人的出错时的提示声
(setq mouse-yank-at-point t)            ;粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t)    ;阻止退出emacs时和外部clipmgr交互导致卡顿 x11
(setq select-enable-clipboard t)        ; wayland 复制粘贴共享
(setq split-width-threshold 180)        ;分屏的时候使用上下分屏
(setq inhibit-compacting-font-caches t) ;使用字体缓存，避免卡顿
(setq word-wrap-by-category t)          ;按照中文折行
(setq garbage-collection-messages t)	;gc时显示消息
(setq byte-compile-warnings nil)	;关闭字节编译警告
(setq load-prefer-newer nil)
(setq custom-file "~/.emacs.d/site-lisp/custom.el")
(setq ad-redefinition-action 'accept)   ;不要烦人的 redefine warning
;; 增加长行处理性能
(setq bidi-inhibit-bpa t)
(setq bidi-paragraph-direction 'left-to-right)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq yes-or-no-prompt "(y or n)")
(keyfreq-mode t)
(keyfreq-autosave-mode t)
(pixel-scroll-mode t)
(pixel-scroll-precision-mode t)
;; (global-hl-line-mode t)
(setq scroll-step 0
      scroll-conservatively 1)

;; 关闭自动备份文件
(setq make-backup-files nil)
;; 关闭启动页
(setq inhibit-startup-screen nil)
;; 关闭dir local
(setq enable-dir-local-variables t)
(setq scroll-margin 0); 设定滚动边距
(setq-default truncate-lines t) ; 不要换行
(setq truncate-partial-width-windows nil)
(setq fill-column 180)
(setq lexical-binding t)
;; 环境变量
(add-to-list 'exec-path "~/.npm-global/bin")
(setq-default recentf-max-saved-items 1000)

(recentf-mode t)

;; 自定义 *scratch* 内容
;;;###autoload
(defun +evan/scratch-setup()
  (interactive)
  (add-hook 'after-init-hook
	    (lambda ()
	      (save-excursion
		(display-line-numbers-mode t)
		(with-current-buffer (get-buffer "*scratch*")
		  (erase-buffer)
		  (insert (format "启动时长: %s" (emacs-init-time)))
		  (insert "\n")
		  (insert-button "Quit Emacs"
				 'action (lambda (_button)
					   (save-buffers-kill-emacs)))
		  (insert "\n")
		  (insert "Recent Files\n")
		  (dolist (f recentf-list)
		    (insert-button f
				   'action (lambda (region)
					     (require 'f)
					     (let* ((f (buffer-substring-no-properties (overlay-start region) (overlay-end region)))
						    (fname (f-filename f)))
					       (find-file-noselect f)
					       (switch-to-buffer fname))))
		    (insert "\n"))
		  ))
	      ))
  )


(provide 'init-better-default)
