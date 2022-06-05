(require 'awesome-tray)

(defun meow-module-info()
  (meow-indicator))
(defface meow-module-face ()
  '((t))
  :group 'awesome-tray)

(add-to-list 'awesome-tray-module-alist
	     '("meow" . (meow-module-info meow-module-face)))

(setq awesome-tray-active-modules '("meow" "location" "belong" "file-path" "buffer-name" "mode-name" "battery" "date"))

(awesome-tray-mode)

(provide 'init-awesome-tray)
