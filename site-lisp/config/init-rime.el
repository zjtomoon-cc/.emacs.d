;; (require 'rime)
(setq default-input-method "rime")
(setq rime-user-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-share-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-show-candidate 'posframe)
(setq rime-posframe-properties
      (list :background-color "#2E3440"
            :foreground-color "#ECEFF4"
            :internal-border-width 0))

(with-eval-after-load "rime"
  (lambda ()
    (set-face-attribute 'rime-highlight-candidate-face nil :width 'normal :inherit 'highlight)))


(provide 'init-rime)
