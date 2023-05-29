(global-set-key (kbd "C-x C-r") #'restart-emacs)
(lazy-one-key-create-menu "Toggle"
			  (:key "F" :description "Toggle bit font" :command +evan/toggle-big-font :filename "init-ui")
			  (:key "w" :description "Toggle write room" :command writeroom-mode :filename "init-writeroom")
			  (:key "p" :description "Toggle proxy" :command +evan/toggle-proxy :filename "init-better-default")
			  (:key "l" :description "Toggle line numbers" :command display-line-numbers-mode :filename "display-line-numbers")
			  (:key "t" :description "Toggle telega" :command +evan/toggle-telega :filename "init-telega")
			  (:key "c" :description "Toggle crow" :command crow-mode :filename "init-crow")
			  (:key "s" :description "Toggle eshell" :command eshell :filename "eshell")
			  (:key "v" :description "Toggle vterm" :command vterm :filename "init-vterm")
			  (:key "T" :description "Toggle transparent" :command +evan/toggle-transparent :filename "init-emacs")
			  (:key "f" :description "Toggle dirvish side" :command +evan/dirvish-side-current-path :filename "init-dirvish"))

(one-key-create-menu
 "Window"
 '((("l" . "Focus right window") . windmove-right)
   (("h" . "Focus left window") . windmove-left)
   (("k" . "Focus up window") . windmove-up)
   (("j" . "Focus down window") . windmove-down)
   (("L" . "Swap right window") . windmove-swap-states-right)
   (("H" . "Swap left window") . windmove-swap-states-left)
   (("K" . "Swap up window") . windmove-swap-states-up)
   (("J" . "Swap down window") . windmove-swap-states-down)
   (("s" . "Split window vertically") . split-window-below)
   (("v" . "Split window horizontally") . split-window-right)
   (("d" . "Delete window") . delete-window)
   (("u" . "Undo window") . winner-undo)
   (("C-h" . "Resize window to smaller") . shrink-window-horizontally)
   (("m" . "Delete other window") . delete-other-windows)
   (("C-k" . "Scroll other window up") . scroll-other-window-down)
   (("C-j" . "Scroll other window down") . scroll-other-window)
   (("r" . "Rotate window") . rotate-window)
   (("R" . "Rotate layout") . rotate-layout)
   ))

;; (transient-define-prefix +evan/key-wm ()
;;   ["Window Manage"
;;    ["focus"
;;     ("l" "focus to right" windmove-right)
;;     ("h" "focus to left" windmove-left)
;;     ("k" "focus to up" windmove-up)
;;     ("j" "focus to down" windmove-down)]
;;    ["swap"
;;     ("L" "swap to right" windmove-swap-states-right)
;;     ("H" "swap to left" windmove-swap-states-left)
;;     ("K" "swap to up" windmove-swap-states-up)
;;     ("J" "swap to down" windmove-swap-states-down)]
;;    ["split"
;;     ("s" "vertically" split-window-below)
;;     ("S" "vertically(root)" split-root-window-below)
;;     ("v" "horizontally" split-window-right)
;;     ("V" "horizontally(root)" split-root-window-right)]
;;    ["action"
;;     ("d" "close" delete-window)
;;     ("K" "close(buffer)" kill-buffer-and-window)
;;     ("u" "undo" winner-undo)
;;     ("r" "redo" winner-redo)
;;     ("m" "only active" delete-other-windows)
;;     ("C-n" "narrower" shrink-window-horizontally)
;;     ("C-s" "shorter" shrink-window)
;;     ("C-k" "scroll other window down" scroll-other-window-down)
;;     ("C-j" "scroll other window down" scroll-other-window)]])


(lazy-one-key-create-menu "File"
			  (:key "s" :description "Save buffer" :command save-buffer :filename "")
			  (:key "d" :description "Drivish" :command dirvish :filename "init-dirvish")
			  (:key "p" :description "Find emacs config" :command +evan/find-emacs-config :filename "init-emacs")
			  (:key "r" :description "Find recent file" :command recentf :filename "init-minibuffer-completion")
			  (:key "f" :description "Find file" :command find-file :filename "init-minibuffer-completion")
			  (:key "F" :description "Find file with fuzzy" :command consult-fzf :filename "init-minibuffer-completion"))

(lazy-one-key-create-menu "Search"
			  (:key "s" :description "Search in buffer" :command consult-line :filename "init-minibuffer-completion")
			  (:key "S" :description "Search in multi buffer" :command consult-line-multi
				:filename "init-minibuffer-completion")
			  (:key "g" :description "RipGreep here" :command consult-ripgrep :filename "init-minibuffer-completion")
			  (:key "f" :description "GitGrep here" :command consult-git-grep :filename "init-minibuffer-completion")
			  (:key "d" :description "Blink Search" :command blink-search :filename "init-blink-search")
			  (:key "r" :description "Colorg" :command color-rg-search-input :filename "init-color-rg")
			  (:key "y" :description "Kill ring history" :command consult-yank-pop :filename "init-minibuffer-completion")
			  (:key "e" :description "Fanyi" :command fanyi-dwim :filename "init-fanyi")
			  (:key "B" :description "Bookmark" :command consult-bookmark :filename "init-minibuffer-completion")
			  (:key "l" :description "Find libray" :command find-library :filename "init-minibuffer-completion"))

(lazy-one-key-create-menu "Buffer"
			  (:key "b" :description "Switch buffers" :command consult-buffer :filename "init-minibuffer-completion")
			  (:key "k" :description "Kill buffer" :command kill-buffer-and-window :filename "")
			  (:key "T" :description "Switch telega buffers" :command telega-switch-buffer :filename "init-telega")
			  (:key "t" :description "Switch telega chat" :command telega-chat-with :filename "init-telega")
			  (:key "r" :description "Revert buffer" :command revert-buffer :filename ""))

(one-key-create-menu
 "Nagivator"
 '((("d" . "Go to definetion") . xref-find-definitions)))


(lazy-one-key-create-menu "EAF"
			  (:key "o" :description "EAF Open anything" :command eaf-open  :filename "init-eaf")
			  (:key "b" :description "EAF Open browser" :command eaf-open-browser  :filename "init-eaf")
			  (:key "h" :description "EAF Open browser with history" :command eaf-open-browser-with-history  :filename "init-eaf")
			  (:key "s" :description "EAF Search" :command eaf-search-it  :filename "init-eaf")
			  )

(lazy-one-key-create-menu "Magit"
			  (:key "v" :description "Open Magit" :command magit :filename "init-magit")
			  (:key "l" :description "Yank git link with current line." :command git-link :filename "git-link")
			  )

(lazy-one-key-create-menu "Useful"
			  (:key "u" :description "Translate region" :command gts-do-translate :filename "init-go-translate")
			  (:key "c" :description "Crow mode" :command one-key-menu-crow :filename "init-crow")
			  (:key "m" :description "Bongo" :command one-key-menu-bongo :filename "init-bongo")
			  (:key "e" :description "English helper" :command lsp-bridge-toggle-english-helper :filename "init-lsp-bridge")
			  (:key "p" :description "Yank buffer filename" :command +evan/yank-buffer-file-name :filename "")
			  (:key "S" :description "Sudo edit" :command sudo-edit :filename "init-sudo-edit")
			  (:key "i" :description "Counsel tips" :command one-key-menu-counsel :filename "init-ivy")
			  (:key "r" :description "Elfeed" :command elfeed :filename "init-elfeed")
			  (:key "1" :description "Profiler start" :command profiler-start :filename "profiler")
			  (:key "d" :description "App launcher" :command app-launcher-run-app :filename "app-launcher")
			  (:key "g" :description "Go translate" :command gts-do-translate :filename "init-go-translate")
			  )

(lazy-one-key-create-menu "Org"
			  (:key "c" :description "Org capture" :command org-capture :filename "init-org")
			  (:key "a" :description "Org agenda" :command org-agenda :filename "init-org"))


(lazy-one-key-create-menu "Blog"
			  (:key "c" :description "Create article" :command +evan/blog-create-article :filename "init-blog")
			  (:key "f" :description "Find article" :command +evan/blog-find-blog-files :filename "init-blog")
			  (:key "p" :description "Preview buffer" :command +evan/blog-preview-current-buffer-in-browser :filename "init-blog")
			  (:key "P" :description "Publish website" :command +evan/blog-save-and-publish-website :filename "init-blog")
			  (:key "d" :description "Delete org and html" :command +evan/blog-delete-org-and-html :filename "init-blog"))

(lazy-one-key-create-menu "code-eglot"
				      (:key "f" :description "Format code" :command apheleia-format-buffer :filename "init-format")
				      (:key "e" :description "Eglot Diagnostic" :command one-key-menu-diagnostic :filename "init-xref")
				      (:key "d" :description "Eglot jump to def" :command xref-find-definitions :filename "init-xref")
				      (:key "D" :description "Eglot jump to def other window" :command xref-find-definitions-other-window :filename "init-xref")
				      (:key "b" :description "Eglot jump back" :command xref-go-back :filename "init-xref")
				      (:key "r" :description "Eglot find reference" :command xref-find-references :filename "init-xref")
				      (:key "n" :description "Eglot rename" :command eglot-rename :filename "init-xref")
				      (:key "i" :description "Eglot find impl" :command eglot-find-implementation :filename "init-xref")
				      (:key "s" :description "Eglot code action" :command eglot-code-actions :filename "init-xref")
				      (:key "E" :description "Eglot toggle diagnostics" :command flymake-mode :filename "init-xref")
				      (:key "`" :description "Add Fold code" :command vimish-fold :filename "init-vimish-fold")
				      (:key "~" :description "Delete Fold code" :command vimish-fold-delete :filename "init-vimish-fold"))


(lazy-one-key-create-menu "code-bridge"
			  (:key "h" :description "Show document" :command lsp-bridge-popup-documentation :filename "init-lsp-bridge")
			  (:key "j" :description "Scroll doc up" :command lsp-bridge-popup-documentation-scroll-up :filename "init-lsp-bridge")
			  (:key "k" :description "Scroll doc down" :command lsp-bridge-popup-documentation-scroll-down :filename "init-lsp-bridge")
			  (:key "s" :description "Toggle sdcv" :command lsp-bridge-toggle-sdcv-helper :filename "init-lsp-bridge")
			  (:key "f" :description "Format code" :command apheleia-format-buffer :filename "init-format")
			  (:key "d" :description "Lsp Bridge jump to def" :command lsp-bridge-find-def :filename "init-lsp-bridge")
			  (:key "D" :description "Lsp Bridge jump to def other window" :command lsp-bridge-find-def-other-window :filename "init-lsp-bridge")
			  (:key "b" :description "Lsp Bridge jump back" :command lsp-bridge-find-def-return :filename "init-lsp-bridge")
			  (:key "r" :description "Lsp Bridge find reference" :command lsp-bridge-find-references :filename "init-lsp-bridge")
			  (:key "n" :description "Lsp Bridge rename" :command lsp-bridge-rename :filename "init-lsp-bridge")
			  (:key "i" :description "Lsp Bridge find impl" :command lsp-bridge-find-impl :filename "init-lsp-bridge")
			  (:key "I" :description "Lsp Bridge find impl other window" :command lsp-bridge-find-impl-other-window :filename "init-lsp-bridge")
			  (:key "a" :description "Lsp Bridge code action" :command lsp-bridge-code-action :filename "init-lsp-bridge")
			  (:key "E" :description "Lsp Bridge toggle diagnostics" :command lsp-bridge-toggle-diagnostics :filename "init-lsp-bridge")
			  (:key "`" :description "Add Fold code" :command vimish-fold :filename "init-vimish-fold")
			  (:key "~" :description "Delete Fold code" :command vimish-fold-delete :filename "init-vimish-fold"))

(lazy-one-key-create-menu "code-lsp"
			  (:key "f" :description "Format code" :command apheleia-format-buffer :filename "init-format")
			  (:key "d" :description "lsp jump to def" :command lsp-find-definition :filename "init-lsp")
			  (:key "D" :description "lsp jump to def other window" :command xref-find-definitions-other-window :filename "xref")
			  (:key "b" :description "lsp jump back" :command xref-go-back :filename "xref")
			  (:key "r" :description "lsp find references" :command lsp-find-references :filename "init-lsp")
			  (:key "m" :description "lsp rename symbol" :command lsp-rename :filename "init-lsp")
			  (:key "i" :description "lsp find implementation" :command lsp-find-implementation :filename "init-lsp")
			  (:key "a" :description "lsp code action" :command lsp-execute-code-action :filename "init-lsp")
			  (:key "n" :description "next error" :command flymake-goto-next-error :filename "flymake")
			  (:key "p" :description "prev error" :command flymake-goto-prev-error :filename "flymake")
			  (:key "s" :description "lsp workspace symbol" :command consult-lsp-symbols :filename "consult-lsp")
			  (:key "S" :description "lsp workspace symbol" :command consult-lsp-file-symbols :filename "consult-lsp")
			  (:key "e" :description "lsp workspace diagnostics" :command consult-lsp-diagnostics :filename "consult-lsp")
			  (:key "`" :description "Add Fold code" :command vimish-fold :filename "init-vimish-fold")
			  (:key "~" :description "Delete Fold code" :command vimish-fold-delete :filename "init-vimish-fold"))

(lazy-load-local-keys '(("C-x u" . vundo))
		      global-map "init-vundo")

;; (lazy-load-global-keys '(("M-x" . counsel-M-x))
;; 		       "init-ivy")

(lazy-load-global-keys '(("C-x m" . embark-act))
		       "init-embark")

;; (with-eval-after-load 'init-boon
;;   (progn
;;     (setq evan-window-keymap
;;       (let ((map (make-sparse-keymap)))
;; 	(define-key map "p" 'windmove-up)
;; 	(define-key map "n" 'windmove-down)
;; 	(define-key map "b" 'windmove-left)
;; 	(define-key map "f" 'windmove-right)
;; 	(define-key map (kbd "C-p") 'windmove-swap-states-up)
;; 	(define-key map (kbd "C-n") 'windmove-swap-states-down)
;; 	(define-key map (kbd "C-b") 'windmove-swap-states-right)
;; 	(define-key map (kbd "C-f") 'windmove-swap-states-left)

	
;; 	(define-key map "w" 'ace-window)
;; 	map))
;;     (lazy-load-local-keys '(("w" . ace-window)) evan-window-keymap "ace-window")
;;     (defvar evan-leader-keymap
;;       (let ((map (make-sparse-keymap)))
;; 	(define-key map "w" evan-window-keymap)
;; 	map))
    
;;     (define-key boon-command-map "\\" evan-leader-keymap)
;;     (keymap-set ctl-x-map (kbd "f") 'find-file)))
(provide 'init-key)
