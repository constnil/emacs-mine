;;; flycheck-setup.el --- Flycheck setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'dot-emacs-funcs)

(progn
  (install-package 'flycheck)
  (require 'flycheck)

  (install-package 'flycheck-pos-tip)

  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; (after 'flycheck
  ;;        (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;;        (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  ;;        (setq flycheck-checkers (delq 'html-tidy flycheck-checkers))
  ;;        (setq flycheck-standard-error-navigation nil))

  (global-flycheck-mode t)

  ;; flycheck errors on a tooltip (doesnt work on console)
  (when (display-graphic-p (selected-frame))
    (eval-after-load 'flycheck
                     '(custom-set-variables
                        '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  (global-set-key (kbd "C-c C-f") 'flycheck-mode))

(provide 'flycheck-setup)

;;; flycheck-setup.el ends here
