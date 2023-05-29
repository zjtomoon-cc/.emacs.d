(require 'telega)
(setq telega-proxies '((:server "192.168.1.128"
				:port "1090"
				:enable t
				:type (:@type "proxyTypeSocks5")))
      telega-chat-show-avatars nil
      telega-chat-fill-column 65
      telega-emoji-use-images nil
      telega-auto-translate-probe-language-codes nil
      telega-translate-to-language-by-default "zh-CN"
      telega-chat-input-markups (list "org")
      )

(setq telega-completing-read-function 'completing-read)
;; (set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji") nil 'prepend)

(setq telega-compleleting-read-function 'completing-read)
(setq telega-mode-line-mode nil)
(telega-notifications-mode t)
(defun +evan/toggle-telega ()
  "切換telega"
  (interactive)
  (if (get-buffer "*Telega Root*")
      (progn (telega-kill t)
	     (message "杀死Telega"))
    (progn (telega t)
	   (message "启动Telega"))))

;; KeyMap
(define-key telega-msg-button-map "k" nil)
(define-key telega-msg-button-map "l" nil)
(define-key telega-msg-button-map (kbd "SPC") 'meow-keypad)
(lazy-load-local-keys '(("t" . telega-chat-with))
		      telega-msg-button-map
		      "init-telega")


;; Face
(set-face-background 'telega-msg-inline-reply (face-attribute 'default :background))
(set-face-background 'telega-msg-self-title (face-attribute 'default :background))
(set-face-background 'telega-msg-user-title (face-attribute 'default :background))
(set-face-background 'telega-msg-heading (face-attribute 'default :background))

(autoload 'project-switch-project "magit" nil t)

(provide 'init-telega)
