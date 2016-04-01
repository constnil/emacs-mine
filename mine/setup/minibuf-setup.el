;;; minibuf-setup.el --- Minibuffer setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)
(require 'completion-setup)

(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is old M-x
  (global-set-key (kbd "C-c M-x") 'execute-extended-command))

(define-key minibuffer-local-map (kbd "C-l") 'helm-minibuffer-history)

(provide 'minibuf-setup)

;;; minibuf-setup.el ends here
