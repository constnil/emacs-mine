;;; init.el --- Emacs initial file

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(let* ((root user-emacs-directory)
       (suits '("live" "mine" "prelude" "space" "bling" "kess"))
       (env (getenv "EMACS_CONFIG"))
       (suit (or (and (member env suits) env) "kess")))
  (message "config suit \"%s\" start loading" suit)
  (setenv "EMACS_CONFIG" suit) ; In case environment variable not set
  (defvar suit-init-file "init.el")
  (let ((setup-file (concat suit ".el")))
    (or (load (expand-file-name setup-file root) t)
        (load (expand-file-name setup-file (expand-file-name "suits" root)) t)))

  (setq user-emacs-directory (expand-file-name suit user-emacs-directory))
  (add-to-list 'load-path user-emacs-directory)
  (require 'package)
  (setq package-user-dir (expand-file-name "elpa" root))
  (load (expand-file-name suit-init-file user-emacs-directory) t)
  (load "~/.personal.el" t)
  (message "config suit \"%s\" loaded" suit))

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(fill-column 80)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(org-export-backends (quote (ascii html icalendar latex man md org texinfo)))
 '(projectile-globally-ignored-file-suffixes
   (quote
    (".pdb" ".dll" ".exe" ".pch" ".obj" ".manifest" ".preset" ".log")))
 '(projectile-project-root-files-bottom-up
   (quote
    (".projectile" ".hg" ".fslckout" ".bzr" "_darcs" ".svn" "CVS" ".git" "Makefile"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
