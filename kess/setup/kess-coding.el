;;; kess-coding.el --- Setup coding environment.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Common setup
;;
(show-paren-mode 1)

(use-package flycheck
  :diminish flycheck-mode
  :bind* ("C-c C-f" . flycheck-mode)
  :config
  (use-package flycheck-pos-tip)
  (when (display-graphic-p (selected-frame))
    (eval-after-load 'flycheck
      '(custom-set-variables
        '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs (concat user-emacs-directory "snippets"))
  (yas-global-mode 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smartparens-config
  :ensure smartparens
  :demand
  :bind (("M-k" . sp-kill-sexp)
         ("M-K" . sp-kill-hybrid-sexp)
         ("<C-M-backspace>" . sp-backward-kill-sexp))
  :config
  (show-smartparens-global-mode t)
  (smartparens-strict-mode 1)
  (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; binding
;;
(bind-keys ("C-c C-c" . comment-region)
           ("C-c C-u" . uncomment-region))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; language setups
;;
(require 'kess-lisp)
(require 'kess-csharp)

(provide 'kess-coding)

;;; kess-coding.el ends here
