(require 'vimish-fold)
(vimish-fold-global-mode t)

(one-key-create-menu "fold"
		     '((("t" . "Toggle fold") . vimish-fold-toggle)
		       (("d" . "Delete fold") . vimish-fold-delete)))

