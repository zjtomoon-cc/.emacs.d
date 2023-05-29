(require 'awesome-tray)

(defun meow-module-info()
  (meow-indicator))

(defface meow-module-face ()
  ""
  :group 'awesome-tray)

(add-to-list 'awesome-tray-module-alist
	     '("meow" . (meow-module-info meow-module-face)))

(setq awesome-tray-active-modules '("meow" "location" "file-path" "buffer-name" "mode-name" "date"))

(add-hook 'font-lock-mode-hook '(lambda ()
				  (set-face-attribute 'awesome-tray-module-file-path-face nil
						      :foreground (face-foreground 'font-lock-string-face)
						      :weight 'normal)

				  ;; (set-face-attribute 'awesome-tray-module-location-face nil
				  ;; 		      :foreground (face-foreground 'font-lock-property-face)
				  ;; 		      :weight 'normal)

				  (set-face-attribute 'awesome-tray-module-buffer-name-face nil
						      :foreground (face-foreground 'font-lock-keyword-face)
						      :weight 'normal)

				  (set-face-attribute 'awesome-tray-module-mode-name-face nil
						      :foreground (face-foreground 'font-lock-type-face)
						      :weight 'normal)

				  (set-face-attribute 'awesome-tray-module-battery-face nil
						      :foreground (face-foreground 'font-lock-warning-face)
						      :weight 'normal)

				  (set-face-attribute 'awesome-tray-module-date-face nil
						      :foreground (face-foreground 'font-lock-warning-face)
						      :weight 'normal)

				  (set-face-attribute 'meow-module-face nil
						      :foreground (face-foreground 'font-lock-variable-name-face)
						      :weight 'normal) ))


;; 为了让awesome-tray内容不要换行
(setq awesome-tray-info-padding-right 5)
(awesome-tray-mode)
(provide 'init-awesome-tray)
