;;; kess-lisp.el --- Setup lisp coding.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Binding
;;
(bind-keys* ("C-x C-r" . eval-region)
            ("C-x C-d" . eval-defun)
            ("C-x C-w" . eval-buffer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Paredit
;;
(use-package paredit
  :demand
  :bind (:map paredit-mode-map
              ("<M-right>" . paredit-backward-barf-sexp)
              ("<M-left>" . paredit-backward-slurp-sexp))
  :config
  (dolist (x '(scheme emacs-lisp lisp clojure lisp-interaction slime-repl cider-repl))
    (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; emacs lisp setup
;;
(use-package eldoc
  :diminish eldoc-mode
  :config
  (eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; clojure setup
;;
(use-package clojure-mode)
(use-package cider)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; common lisp setup
;;
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")

(provide 'kess-lisp)

;;; kess-lisp.el ends here
