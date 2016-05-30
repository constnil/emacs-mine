;;; lisp-setup.el --- Lisp setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

;; Common setup
(electric-pair-mode 1)
(show-paren-mode 1)

(use-package smartparens
  :config
  (smartparens-strict-mode +1))

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode +1))

(use-package paredit
  :config
  (define-key paredit-mode-map (kbd "C-=") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C--") 'paredit-forward-barf-sexp))

(dolist (x '(scheme emacs-lisp lisp clojure lisp-interaction slime-repl cider-repl))
  (add-hook (intern (concat (symbol-name x) "-mode-hook"))
            (lambda ()
              (enable-paredit-mode)
              (rainbow-delimiters-mode))))

;; emacs lisp setup
(use-package eldoc
  :diminish eldoc-mode
  :config
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode))

;; common lisp setup
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")

;; clojure setup
(use-package clojure-mode)
(use-package cider)

(provide 'lisp-setup)

;;; lisp-setup.el ends here
