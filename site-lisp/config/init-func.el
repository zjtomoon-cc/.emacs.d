;;;###autoload
(defun +evan/find-emacs-config ()
  (interactive)
  (find-file (read-file-name "📂: " (expand-file-name "~/.emacs.d/site-lisp/config/"))))


;;;###autoload
(defun +evan/reload-load-path ()
  (interactive)
  (let ((default-directory "~/.emacs.d/site-lisp")
	(gc-cons-threshold most-positive-fixnum)
	(gc-cons-percentage 1.0))
    (normal-top-level-add-subdirs-to-load-path)))

(defun +evan/find-emacs-config-2()
  (interactive)
  (read-file-name "init file" (expand-file-name "~/.emacs.d/site-lisp/config")))

;;;###autoload
(defun +clean-theme()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

;;;###autoload
(defun +evan/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
        (setq url-proxy-services
              '(("http" . "192.168.1.128:1085")
                ("https" . "192.168.1.128:1085")))
        (message "代理已开启."))
    (setq url-proxy-services nil)
    (message "代理已关闭.")))

(defun +evan/yank-buffer-file-name ()
  (interactive)
  (push buffer-file-name kill-ring))

;;;###autoload
(defun +evan/toggle-transparent ()
  (interactive)
  
  (defun corfu-frame-alpha (alpha)
    (require 'dash)
    ;; set corfu frame alpha
    (let* ((alpha-background (--find (eq (car it) 'alpha-background)
				     corfu--frame-parameters)))
      (if alpha-background
	  (setq corfu--frame-parameters
		(--map (if (eq (car it) 'alpha-background)
			   (cons (car it) alpha)
			 it)
		       corfu--frame-parameters))
	(add-to-list 'corfu--frame-parameters
		     (cons 'alpha-background alpha)))))
  ;; set frame alpha
  (if (eq (frame-parameter nil 'alpha-background) 100)
      (progn
	(set-frame-parameter nil 'alpha-background 80)
	(corfu-frame-alpha 95))
    (progn
      (set-frame-parameter nil 'alpha-background 100)
      (corfu-frame-alpha 100))))



;;;###autoload
(defun +evan/popup-scratch ()
  (interactive)
  (let ((buf-name (concat "*scratch*-" (format-time-string "%H:%m:%S"))))
    (with-current-buffer (get-buffer-create buf-name)
      (call-interactively 'text-mode)
      (popwin:popup-buffer (current-buffer)))))

(defun +evan/screen-lock ()
  (interactive)
  (toggle-frame-fullscreen)
  (+evan/toggle-big-font)
  (switch-to-buffer "*scratch*")
  (delete-other-windows)
  (hl-line-mode nil)
  (run-with-timer 0.2 0 (lambda ()
			  (shell-command "grim /tmp/lock.png ; swaylock -i /tmp/lock.png")
			  (+evan/toggle-big-font))))

;;;###autoload
(defun +evan/gen-qrcode (text)
  (interactive "sText:")
  (async-shell-command (mapconcat 'identity (list "qrencode" "-t" "ANSIUTF8" (format "'%s'" text) ) " ") "*qrcode*")
  )

(provide 'init-func)
