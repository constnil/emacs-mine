;;; kess-package.el --- Setup package and use-package.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; package.el setup
;;
(let ((archives
       '((       "melpa" . "http://melpa.org/packages/")
         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
         (   "marmalade" . "http://marmalade-repo.org/packages/")
         (         "org" . "http://orgmode.org/elpa/"))))
  (when (< emacs-major-version 24)
    (add-to-list 'archives
                 '("gnu" . "http://elpa.gnu.org/packages/")))
  (dolist (arch archives)
    (add-to-list 'package-archives arch)))

(setq package-enable-at-startup nil)
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; use-package setup
;;
(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
    (package-refresh-contents))
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t
        use-package-verbose t))

;; packages that use-package recommend/depend
(use-package diminish)
(use-package bind-key
  :bind* ("C-c C-." . describe-personal-keybindings))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; some handy packages
;;
(use-package popwin
  :config
  (popwin-mode 1))

(use-package ack)

(use-package ag)

(use-package undo-tree
  :bind* (("C-/" . undo-tree-undo)
          ("M-/" . undo-tree-redo))
  :config
  (global-undo-tree-mode))

(use-package goto-chg
  :bind (("C-." . goto-last-change)
         ("C-," . goto-last-change-reverse)))

(use-package magit
  :config
  (setq magit-last-seen-setup-instructions "1.4.0")
  (add-hook 'magit-log-edit-mode-hook
            (lambda ()
              (set-fill-column 72)
              (auto-fill-mode 1))))

(use-package dired-k
  :config
  (add-hook 'dired-initial-position-hook 'dired-k))

(use-package bookmark+)

(use-package markdown-mode+)

(provide 'kess-package)

;;; kess-use-package.el ends here
