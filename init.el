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
  (require 'package)
  (setq package-user-dir (expand-file-name "elpa" config-root))
  (defvar suit-init-file "init.el")
  (let ((setup-file (format "%s.el" suit)))
	(or (load (expand-file-name setup-file config-root) t)
		(load (expand-file-name setup-file
								(expand-file-name "suits" config-root)) t)))
  (defvar suit-root (expand-file-name suit config-root))
  (add-to-list 'load-path suit-root)
  (load (expand-file-name suit-init-file suit-root) t)
  (message "config suit \"%s\" loaded" suit))

;;; init.el ends here
