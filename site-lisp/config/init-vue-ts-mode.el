(require 'treesit)


(treesit-available-p)

(treesit-ready-p 'vue)

(setq fuck (treesit-parser-create 'vue (get-buffer "App.vue"))

(treesit-parser-delete fuck)

(treesit-parser-buffer 'vue)


(setq keyword-element-regexp (rx string-start
				 (seq (or "script" "template" "style") "_element")
				 string-end))

(with-current-buffer (get-buffer "App.vue")
  (define-derived-mode vue-ts-mode prog-mode "vue ts mode"
    :group 'vue
    (treesit-parser-create 'vue)
    (setq-local vue-ts-mode--keywords
      '("script" "template" "style"))

    (setq treesit-font-lock-feature-list
		'((keyword)))
    (setq vue-ts-mode--font-lock-settings
		(treesit-font-lock-rules
		 :language 'vue
		 :feature 'keyword
		 `([,@vue-ts-mode--keywords] @font-lock-keyword-face)))
    (setq-local treesit-font-lock-settings vue-ts-mode--font-lock-settings)
    (treesit-major-mode-setup)
    (message "vue ts mode sdasjdlkj")
    )
  )





