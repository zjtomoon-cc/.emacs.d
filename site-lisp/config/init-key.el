(one-key-create-menu
 "Toggle"
 '((("p" . "Toggle proxy") . +evan/toggle-proxy)
   (("l" . "Toggle line numbers") . display-line-numbers-mode)
   (("t" . "Toggle telega") . +evan/toggle-telega)
   (("c" . "Toggle crow") . crow-mode)
   (("s" . "Toggle eshell") . eshell)))

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
   (("u" . "Undo window") . winner-undo)))
(one-key-create-menu
 "File"
 '((("s" . "Save buffer") . save-buffer)
   (("d" . "Drivish") . dirvish)
   (("p" . "Find emacs config") . +evan/find-emacs-config)
   (("r" . "Find recent file") . consult-recent-file)
   (("f" . "Find file") . find-file)))

(one-key-create-menu
 "Search"
 '((("s". "Search in buffer") . consult-line )
   (("S" . "Search in multi buffer") . consult-line-multi)
   (("g" . "RipGrep here") . consult-ripgrep)))

(one-key-create-menu
 "Buffer"
 '((("b" . "Switch buffers") . consult-buffer)
   (("k" . "Kill buffer") . kill-buffer-and-window)
   (("T" . "Switch telega buffers") . telega-switch-buffer)
   (("t" . "Switch telega chat") . telega-chat-with)
   (("r" . "Revert buffer") . revert-buffer)))

(one-key-create-menu
 "Nagivator"
 '((("d" . "Go to definetion") . xref-find-definitions)))

(one-key-create-menu
 "Code"
 '((("f" . "Format code") . format-all-buffer)))

(one-key-create-menu
 "Useful"
 '((("u" . "Translate region") . gts-do-translate)
   (("c" . "Crow mode") . one-key-menu-crow)
   (("m" . "Bongo") . one-key-menu-bongo)))
;; (lazy-load-local-keys
;;  '(("C-d" . corfu-doc-toggle)
;;    ("C-S-n" . corfu-doc-scroll-down)
;;    ("C-S-p" . corfu-doc-scroll-up))
;;  corfu-map
;;  "init-corfu")
(provide 'init-key)
