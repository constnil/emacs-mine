;;; init.el --- Emacs initial file

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(let* ((config-root user-emacs-directory)
       (suits '("live" "mine" "prelude" "space"))
       (env (getenv "EMACS_CONFIG"))
       (suit (or (and (member env suits) env) "mine")))
  (message "config suit \"%s\" start loading" suit)
  (setenv "EMACS_CONFIG" suit) ; In case environment variable not set
  (defvar suit-init-file "init.el")
  (let ((setup-file (concat suit ".el")))
    (or (load (expand-file-name setup-file config-root) t)
        (load (expand-file-name setup-file
                                (expand-file-name "suits" config-root)) t)))

  (setq user-emacs-directory (expand-file-name suit user-emacs-directory))
  (add-to-list 'load-path user-emacs-directory)
  (require 'package)
  (setq package-user-dir (expand-file-name "elpa" config-root))
  (load (expand-file-name suit-init-file user-emacs-directory) t)
  (message "config suit \"%s\" loaded" suit))

;;; init.el ends here
