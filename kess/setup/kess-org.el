;;; kess-org.el --- Setup org mode.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; setting
;;
(setq org-catch-invisible-edits 'smart
      org-completion-use-ido t
      org-ctrl-k-protect-subtree t
      org-enforce-todo-checkbox-dependencies t
      org-enforce-todo-dependencies t
      org-log-done 'time
      org-return-follows-link t
      org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-special-ctrl-o t
      org-startup-indented t
      org-tags-column 0
      org-use-property-inheritance t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "OPEN(o)" "INSPECT(i)" "|" "FIXED(f)" "CLOSED(c)" "WONTFIX(w)" "NOREPROD(n)")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; skeleton
;;
(require 'org)
(add-hook 'org-mode-hook 'abbrev-mode)

(define-skeleton sk-org-exp
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
  ""
  "#+BEGIN_EXAMPLE\n"
  _ "\n"
  "#+END_EXAMPLE")
(define-abbrev org-mode-abbrev-table "iexp" "" 'sk-org-exp)

(define-skeleton sk-org-src
  "Input #+begin_src #+end_src in org-mode"
  ""
  "#+begin_src emacs-lisp \n"
  _ "\n"
  "#+end_src")
(define-abbrev org-mode-abbrev-table "isrc" "" 'sk-org-src)

(define-skeleton sk-org-prop
  "Input :PROPERTIES: :END: in org-mode"
  ""
  >":PROPERTIES:\n"
  > _ "\n"
  >":END:")
(define-abbrev org-mode-abbrev-table "iprop" "" 'sk-org-prop)

(define-skeleton sk-org-html
  ""
  ""
  "#+BEGIN_HTML\n"
  "<pre lang=\"lisp\" line=\"1\">\n"
  _"\n"
  "</pre>\n"
  "#+END_HTML\n")
(define-abbrev org-mode-abbrev-table "ihtml"  "" 'sk-org-html)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; binding
;;
(bind-keys :map org-mode-map
           ("C-c <C-tab>" . org-force-cycle-archived)
           ("M-n" . org-forward-heading-same-level)
           ("M-p" . org-backward-heading-same-level)
           ("M-u" . outline-up-heading))

(bind-keys* ("C-c a" . org-agenda)
            ("C-c b" . org-iswitchb)
            ("C-c c" . org-capture)
            ("C-c l" . org-store-link))

(provide 'kess-org)

;;; kess-org.el ends here
