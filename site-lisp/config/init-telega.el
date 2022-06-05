(require 'telega)
(setq telega-proxies '((:server "127.0.0.1"
                          :port "1088"
                          :enable t
                          :type (:@type "proxyTypeSocks5")))
        telega-chat-show-avatars nil
        telega-chat-fill-column 65
        telega-emoji-use-images t)
(set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji") nil 'prepend)

(setq telega-compleleting-read-function 'completing-read)
(setq telega-mode-line-mode nil)
(defun +evan/toggle-telega ()
  "切換telega"
  (interactive)
  (if (get-buffer "*Telega Root*")
      (progn (telega-kill t)
	     (message "杀死Telega"))
    (progn (telega t)
	   (message "启动Telega"))))
(define-key telega-msg-button-map "k" nil)

(provide 'init-telega)
