;;; package-setup.el --- ELPA setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'package)

(let ((archives
	   '(("melpa" . "http://melpa.org/packages/")
		 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
		 ("marmalade" . "http://marmalade-repo.org/packages/"))))
  (when (< emacs-major-version 24)
	(add-to-list 'archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (dolist (arch archives)
	(add-to-list 'package-archives arch)))

(setq package-user-dir
	  (expand-file-name "elpa" user-emacs-directory))
(setq package-enable-at-startup nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
	(package-refresh-contents))
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
(require 'diminish)
(require 'bind-key)

(provide 'package-setup)

;;; package-setup.el ends here
