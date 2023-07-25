(require 'rime)
(setq default-input-method "rime")
(setq rime-user-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-share-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-show-candidate 'popup)
(setq rime-posframe-properties
      (list :background-color "#2E3440"
            :foreground-color "#ECEFF4"
            :internal-border-width 0))

(set-face-attribute 'rime-highlight-candidate-face nil :width 'normal :inherit 'highlight)
(provide 'init-rime)
