(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                       ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                       ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    ;; (leaf hydra :ensure t)
    ;; (leaf el-get :ensure t)
    ;; (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

(provide 'init-leaf)
