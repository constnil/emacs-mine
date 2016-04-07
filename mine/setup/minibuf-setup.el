;;; minibuf-setup.el --- Minibuffer setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)
(require 'completion-setup)

(use-package smex
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c M-x" . execute-extended-command))
  :config
  (smex-initialize))

(provide 'minibuf-setup)

;;; minibuf-setup.el ends here
