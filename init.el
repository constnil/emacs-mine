;;; init.el --- The init file "emacs-mine" config.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'package)

(defvar is-mac (equal system-type 'darwin))
(defvar is-mswin (equal system-type 'windows-nt))
(defvar is-cygwin (equal system-type 'cygwin))

(let ((archives
       '(("melpa" . "http://melpa.org/packages/")
         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
         ("marmalade" . "http://marmalade-repo.org/packages/"))))
  (dolist (arch archives)
    (add-to-list 'package-archives arch)))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)

(let* ((current-dir (file-name-directory load-file-name))
       (setup-dir (expand-file-name "setup" current-dir)))
  (add-to-list 'load-path setup-dir))

(require 'evil-setup)
(require 'lisp-setup)
;(require 'minibuf-setup)
;(require 'flycheck-setup)
;(require 'acejump-setup)
;(require 'projectile-setup)
;(require 'magit-setup)
;(require 'misc-setup)

(global-set-key (kbd "M-h") 'previous-buffer)
(global-set-key (kbd "M-l") 'next-buffer)

(when window-system
  ;; windows system frame default size
  (add-to-list 'default-frame-alist '(height . 25))
  (add-to-list 'default-frame-alist '(width . 100)))

(message "MINE config load finished!")

;;; init.el ends here
