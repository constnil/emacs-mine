;;; coding-setup.el --- Common coding setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'syntax-check-setup)
(require 'completion-setup)
(require 'projectile-setup)

(require 'lisp-setup)
(require 'csharp-setup)

(require 'snippet-setup)

(require 'git-setup)

(global-linum-mode t)
(setq-default tab-width 4)
(setq gdb-many-windows t)

(provide 'coding-setup)

;;; coding-setup.el ends here

