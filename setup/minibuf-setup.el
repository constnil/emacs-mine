;;; minibuf-setup.el --- Minibuffer setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package smex
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is old M-x
  (global-set-key (kbd "C-c M-x") 'execute-extended-command))

(provide 'minibuf-setup)

;;; minibuf-setup.el ends here
