(require 'with-editor)
(require 'magit)
(one-key-create-menu
 "Magit"
 '((("v" . "Open magit") . magit)))
(provide 'init-magit)
