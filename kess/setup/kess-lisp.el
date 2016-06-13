;;; kess-lisp.el --- Setup lisp coding.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

;; Common setup
(show-paren-mode 1)

(bind-keys* ("C-x C-r" . eval-region)
            ("C-x C-d" . eval-defun)
            ("C-x C-w" . eval-buffer))

;; Parens
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package paredit
  :demand
  :bind (:map paredit-mode-map
              ("C-=" . paredit-forward-slurp-sexp)
              ("C--" . paredit-forward-barf-sexp))
  :config
  (unbind-key "M-?" paredit-mode-map)

  (dolist (x '(scheme emacs-lisp lisp clojure lisp-interaction slime-repl cider-repl))
    (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)))

(use-package smartparens
  :config
  (smartparens-strict-mode 1))

;; emacs lisp setup
(use-package eldoc
  :diminish eldoc-mode
  :config
  (eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode))

;; common lisp setup
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")

;; clojure setup
(use-package clojure-mode)
(use-package cider)

(provide 'kess-lisp)

;;; kess-lisp.el ends here
