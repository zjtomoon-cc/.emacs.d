(require 'blink-search)
(setq blink-search-enable-posframe nil)
(setq blink-search-enable-log nil)
(add-hook 'blink-search-mode-hook #'meow-insert-mode)
