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
  :bind (:map smartparens-mode-map
              ("M-k" . sp-kill-sexp)
              ("M-K" . sp-kill-hybrid-sexp)
              ("<C-M-backspace>" . sp-backward-kill-sexp)

              ;; ("C-M-a" . sp-beginning-of-sexp)
              ;; ("C-M-e" . sp-end-of-sexp)

              ;; ("C-<down>" . sp-down-sexp)
              ;; ("C-<up>"   . sp-up-sexp)
              ;; ("M-<down>" . sp-backward-down-sexp)
              ;; ("M-<up>"   . sp-backward-up-sexp)

              ;; ("C-M-f" . sp-forward-sexp)
              ;; ("C-M-b" . sp-backward-sexp)

              ;; ("C-M-n" . sp-next-sexp)
              ;; ("C-M-p" . sp-previous-sexp)

              ;; ("C-S-f" . sp-forward-symbol)
              ;; ("C-S-b" . sp-backward-symbol)

              ;; ("C-<right>" . sp-forward-slurp-sexp)
              ;; ("M-<right>" . sp-forward-barf-sexp)
              ;; ("C-<left>"  . sp-backward-slurp-sexp)
              ;; ("M-<left>"  . sp-backward-barf-sexp)

              ;; ("C-M-t" . sp-transpose-sexp)
              ;; ("C-M-w" . sp-copy-sexp)

              ;; ("C-M-d" . delete-sexp)

              ;; ("M-<backspace>" . backward-kill-word)
              ;; ("C-<backspace>" . sp-backward-kill-word)
              ;; ([remap sp-backward-kill-word] . backward-kill-word)

              ;; ("M-[" . sp-backward-unwrap-sexp)
              ;; ("M-]" . sp-unwrap-sexp)

              ;; ("C-x C-t" . sp-transpose-hybrid-sexp)

              ;; ("C-c ("  . wrap-with-parens)
              ;; ("C-c ["  . wrap-with-brackets)
              ;; ("C-c {"  . wrap-with-braces)
              ;; ("C-c '"  . wrap-with-single-quotes)
              ;; ("C-c \"" . wrap-with-double-quotes)
              ;; ("C-c _"  . wrap-with-underscores)
              ;; ("C-c `"  . wrap-with-back-quotes))
              )
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
