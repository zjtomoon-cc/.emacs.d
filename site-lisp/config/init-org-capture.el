(require 'org-capture)

(defun +evan/setup-org-capture ()
  (setq org-capture-templates nil)
  (push '("j" "我的日志" entry (file+headline"~/Blog/org/diary.org" "日志") "* %U - %^{标题}\n  %?") org-capture-templates)
  (push '("i" "我的闪念" entry (file+headline "~/Blog/org/idea.org" "闪念") "* %U - %^{标题} %^g\n  %?\n") org-capture-templates)
  (push '("k" "我的百科" entry (file+headline "~/Blog/org/wiki.org" "WIKI") "* %^{标题} %t %^g\n  %?\n") org-capture-templates)
  (push '("t" "任务" entry (file+headline "~/Org/todo.org" "任务") "* TODO %^{标题} %t %^g\n  %?\n") org-capture-templates)
  (push '("n" "LNKS" entry (file+headline "~/Org/lnks.org" "任务") "* TODO %^{标题} %t\n  %?\n") org-capture-templates)
  (push '("b" "笔记" entry (file+headline "~/Org/note.org" "笔记") "* %^{标题} %t\n  %?\n") org-capture-templates)
  )

(provide 'init-org-capture)
