(require 'dirvish)
(require 'dirvish-side)
(require 'dirvish-emerge)
(require 'dirvish-ls)
(require 'dirvish-collapse)
(require 'dirvish-history)
(require 'dirvish-quick-access)
(require 'dirvish-side)
(require 'dirvish-fd)
(require 'dirvish-narrow)


;; dired 
(setq dired-dwim-target t)
(setq dired-listing-switches "-alh"
      dired-auto-revert-buffer t)
(keymap-set dired-mode-map "C-b" 'dired-up-directory)
(keymap-set dired-mode-map "C-f" 'dired-find-file)
(keymap-set dired-mode-map "x" 'dired-do-flagged-delete)

;; 当前目录
(defun +evan/dirvish-side-current-path ()
  (interactive)
  (dirvish-side))


;; 文件归类
(setq dirvish-emerge-groups '(("Recent files" (predicate . recent-files-2h))
			      ("Documents" (extensions "pdf" "tex" "bib" "epub"))
			      ("Video" (extensions "mp4" "mkv" "webm"))
			      ("Pictures" (extensions "jpg" "png" "svg" "gif"))
			      ("Audio" (extensions "mp3" "flac" "wav" "ape" "aac"))
			      ("Archives" (extensions "gz" "rar" "zip"))))
;; 每个entry可显示的属性
(setq dirvish-attributes
      '(file-time
	file-size))

;; pdf预览使用pdf-preface
(setq dirvish-preview-dispatchers
      (cl-substitute 'pdf-preface 'pdf dirvish-preview-dispatchers))

;; 使用 exa 进行预览
(dirvish-define-preview exa (file)
  "Use `exa' to generate directory preview."
  :require ("exa") ; tell Dirvish to check if we have the executable
  (when (file-directory-p file) ; we only interest in directories here
    `(shell . ("exa" "-al" "--color=always" "--icons"
               "--group-directories-first" ,file))))
(add-to-list 'dirvish-preview-dispatchers 'exa)

;; dirivish-side模式下关闭行号显示
(add-hook 'dirvish-side-follow-mode-hook (lambda () (display-line-numbers-mode -1)))

;; 使用dirvish替代dired
(dirvish-override-dired-mode)



;; 快捷菜单
(transient-define-prefix dirvish-dispatch ()
  "Main menu for Dired/Dirvish."
  [:description
   (lambda () (dirvish--format-menu-heading
          "Dirvish main menu"
          "Press ? to see more info for the current menu"))
   "Transient commands"
   ("a" "Quick access"           dirvish-quick-access)
   ("h" "Go to history entries"  dirvish-history-menu)
   ("s" "Sort current buffer"    dirvish-quicksort)
   ("l" "Setup listing switches" dirvish-ls-switches-menu)
   ("f" "Setup fd-find switches" dirvish-fd-switches-menu
    :if (lambda () (dirvish-prop :fd-arglist)))
   ("m" "Manage marks"           dirvish-mark-menu)
   ("e" "Manage emerged groups"  dirvish-emerge-menu)
   ("r" "Rename files"           dirvish-renaming-menu)
   ("i" "Get file information"   dirvish-file-info-menu)
   "" "Actions | Essential commands"
   ("n" "Live narrowing"         dirvish-narrow)
   ("u" "User interface setup"   dirvish-setup-menu)
   ("c" "Dired cheatsheet"       dirvish-dired-cheatsheet)])

(provide 'init-dirvish)
