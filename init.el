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
  (setq user-emacs-directory (expand-file-name suit user-emacs-directory))
  (defvar suit-init-file "init.el")
  (let ((setup-file (concat suit ".el")))
	(or (load (expand-file-name setup-file config-root) t)
		(load (expand-file-name setup-file
								(expand-file-name "suits" config-root)) t)))
  (defvar suit-root (expand-file-name suit config-root))
  (add-to-list 'load-path suit-root)
  (require 'package)
  (setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
  (let ((archives
		 '(("melpa" . "http://melpa.org/packages/")
		   ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
		   ("marmalade" . "http://marmalade-repo.org/packages/"))))
	(when (< emacs-major-version 24)
	  (add-to-list 'archives '("gnu" . "http://elpa.gnu.org/packages/")))
	(dolist (arch archives)
	  (add-to-list 'package-archives arch)))
  (load (expand-file-name suit-init-file suit-root) t)
  (message "config suit \"%s\" loaded" suit))

;;; init.el ends here
