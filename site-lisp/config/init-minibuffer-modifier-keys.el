(add-hook 'minibuffer-mode-hook #'(lambda ()
				    (require 'minibuffer-modifier-keys)
				    (minibuffer-modifier-keys-setup t)))

(provide 'init-minibuffer-modifier-keys)
