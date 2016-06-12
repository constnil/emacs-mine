;;; init.el --- The init file "emacs-mine" config.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(prefer-coding-system 'utf-8)

(let* ((load-dir (file-name-directory load-file-name))
       (setup-dir (expand-file-name "setup" load-dir)))
  (add-to-list 'load-path setup-dir)

  (defvar is-mac (equal system-type 'darwin))
  (defvar is-mswin (equal system-type 'windows-nt))

  (let ((archives
         '(("melpa" . "http://melpa.org/packages/")
           ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
           ("marmalade" . "http://marmalade-repo.org/packages/")
           ("org" . "http://orgmode.org/elpa/"))))
    (when (< emacs-major-version 24)
      (add-to-list 'archives '("gnu" . "http://elpa.gnu.org/packages/")))
    (dolist (arch archives)
      (add-to-list 'package-archives arch)))
  (setq package-enable-at-startup nil)
  (package-initialize)

  (unless (package-installed-p 'use-package)
    (unless (assoc 'use-package package-archive-contents)
      (package-refresh-contents))
    (package-install 'use-package))

  (require 'use-package)
  (setq use-package-always-ensure t)

  (use-package better-defaults)
  (use-package diminish)
  (use-package bind-key
    :bind* ("C-c C-." . describe-personal-keybindings))

  ;; (require 'os-setup)
  ;; (require 'frame-setup)
  ;; (require 'buffer-setup)
  ;; (require 'window-setup)
  ;; (require 'minibuf-setup)
  ;; (require 'evil-setup)
  ;; (require 'coding-setup)
  ;; (require 'misc-setup)
  ;; (require 'server-setup)
  ;; (require 'org-setup)
  ;; (require 'binding-setup)
  ;; (require 'skeleton-setup)
  )

;;; init.el ends here
