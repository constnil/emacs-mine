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
  (global-flycheck-mode t)

  ;; flycheck errors on a tooltip (doesnt work on console)
  (when (display-graphic-p (selected-frame))
    (eval-after-load 'flycheck
      '(custom-set-variables
	'(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-pos-tip)

(provide 'syntax-check-setup)

;;; syntax-check-setup.el ends here
