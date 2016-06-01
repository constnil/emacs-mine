;;; misc-setup.el --- Uncategorized setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'theme-setup)
(require 'completion-setup)

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (global-set-key (kbd "C-/") 'undo-tree-undo)
  (global-set-key (kbd "M-/") 'undo-tree-redo))

(use-package bookmark+)
(use-package markdown-mode+)
(use-package guru-mode
  :config
  (setq guru-warn-only t)
  (guru-global-mode +1))

(setq inhibit-startup-screen t)
(setq gc-cons-threshold 20000000)

(provide 'misc-setup)

;;; misc-setup.el ends here

