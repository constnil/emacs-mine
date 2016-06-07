;;; skeleton-setup.el --- Skeleton setups.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;; Org mode skeletons
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
  "#+begin_src lisp \n"
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

(provide 'skeleton-setup)

;;; skeleton-setup.el ends here
