;;; syntax-check-setup.el --- Syntax check setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package flycheck
  :diminish flycheck-mode
  :config
  (when (display-graphic-p (selected-frame))
    (eval-after-load 'flycheck
      '(custom-set-variables
        '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  (global-set-key (kbd "C-c C-c") 'flycheck-mode)
  (use-package flycheck-pos-tip))

(provide 'syntax-check-setup)

;;; syntax-check-setup.el ends here
