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
		 ("marmalade" . "http://marmalade-repo.org/packages/")
		 ("org" . "http://orgmode.org/elpa/"))))
  (when (< emacs-major-version 24)
	(add-to-list 'archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (dolist (arch archives)
	(add-to-list 'package-archives arch)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
	(package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package diminish)
(use-package bind-key
  :bind* ("C-." . describe-personal-keybindings))

(provide 'package-setup)

;;; package-setup.el ends here
