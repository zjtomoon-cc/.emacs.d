(fset 'yes-or-no-p 'y-or-n-p)
;; 不需要使用默认的自动保存
(setq auto-save-default nil)
;; 关闭自动备份文件
(setq make-backup-files nil)
;; 关闭启动页
(setq inhibit-startup-screen t)
(winner-mode t)
;; 开启自动重载buffer
(global-auto-revert-mode t)
(recentf-mode t)
;; 设定滚动边距
(setq scroll-margin 5)
;;;###autoload
(defun +evan/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
        (setq url-proxy-services
              '(("http" . "127.0.0.1:8889")
                ("https" . "127.0.0.1:8889")))
        (message "代理已开启."))
    (setq url-proxy-services nil)
    (message "代理已关闭.")))

(provide 'init-better-default)
