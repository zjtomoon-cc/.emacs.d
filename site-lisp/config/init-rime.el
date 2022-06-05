(require 'rime)
(setq default-input-method "rime")
(setq rime-user-data-dir (concat no-littering-etc-directory "/rime"))
(setq rime-share-data-dir (concat no-littering-etc-directory "/rime"))
(setq rime-posframe-properties
      (list :background-color "#2E3440"
            :foreground-color "#ECEFF4"
            ;; :font evan/en-font-name
            :internal-border-width 0))
(setq default-input-method "rime"
      rime-show-candidate 'posframe)
(provide 'init-rime)
