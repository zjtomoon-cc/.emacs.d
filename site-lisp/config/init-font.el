;;;###autoload
(defun +evan/set-cn-fonts ()
  (interactive)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     "fontset-default"
     charset
     (font-spec :name "Sarasa Mono SC"
                :style 'normal
                :weight 'normal
                :slant 'normal
                :size 13.0))))
;;;###autoload
(defun +evan/set-fonts ()
  (interactive)
  (when (window-system)
    (progn
        (if (version< "27.0" emacs-version)
            (set-fontset-font
             "fontset-default" 'unicode "Noto Color Emoji" nil 'prepend)
          (set-fontset-font
           t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend))
        (setq face-font-rescale-alist nil)
        (set-face-attribute
         'default nil
         :font (font-spec :family "Iosevka"
                          :weight 'semi-bold
                          :slant 'normal
                          :size 13.0))
        (+evan/set-cn-fonts))))


(+evan/set-fonts)
(+evan/set-cn-fonts)

(provide 'init-font)
