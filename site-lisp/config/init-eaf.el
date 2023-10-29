(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-git)
(require 'eaf-file-browser)
(require 'eaf-video-player)
(require 'eaf-music-player)

(defun eaf-translate-text (text)
  (interactive)
  (require 'init-crow)
  (crow--gen-translated-text "text")
  (message "%s" crow--translated-text))

(setq
 eaf-proxy-type "socks5"
 eaf-proxy-host "192.168.1.128"
 eaf-proxy-port "1090"
 eaf-browser-dark-mode nil)

(eaf-bind-key meow-keypad "SPC" eaf-browser-keybinding)
(eaf-bind-key eaf-py-proxy-insert_or_scroll_up_page "M-SPC" eaf-browser-keybinding)
(eaf-bind-key nil "u" eaf-browser-keybinding)


(provide 'init-eaf)
