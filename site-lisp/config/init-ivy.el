(require 'swiper)
(require 'ivy)
(require 'counsel)
(require 'amx)
(require 'init-ivy-pinyin)
(ivy-mode t)
(amx-mode t)				;

(require 'wgrep)
(setq-default ivy-use-virtual-buffers nil
	      ivy-height 25)


(add-to-list 'ivy-height-alist (cons 'counsel-switch-buffer 20))

(setq-default counsel-search-engine 'google)

(one-key-create-menu "Counsel"
		     '((("w" . "Switch desktop window.") . counsel-wmctrl)
		       (("s" . "Use search engine.") . counsel-search)
		       (("d" . "Run linux app") . counsel-linux-app)))

(provide 'init-ivy)
