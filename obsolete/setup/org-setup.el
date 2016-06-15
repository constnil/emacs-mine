;;; org-setup.el --- OrgMode setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(setq org-startup-indented t)
(setq org-special-ctrl-k t)
(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-o t)
(setq org-ctrl-k-protect-subtree t)
(setq org-catch-invisible-edits 'smart)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-log-done 'time)
(setq org-completion-use-ido t)
(setq org-return-follows-link t)
(setq org-use-property-inheritance t)
(setq org-tags-column 0)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "OPEN(o)" "INSPECT(i)" "|" "FIXED(f)" "CLOSED(c)" "WONTFIX(w)" "NOREPROD(n)")))

(provide 'org-setup)

;;; org-setup.el ends here
