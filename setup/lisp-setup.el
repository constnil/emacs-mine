;;; lisp-setup.el --- Lisp setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'var-setup)
(require 'use-package)

(use-package smartparens
  :config
  (smartparens-strict-mode +1))

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode +1))

(use-package rainbow-blocks :disabled t)
(use-package clojure-mode)
(use-package paredit)
(use-package cider)

(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)
  (when (fboundp 'rainbow-blocks-mode)
    (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-blocks-mode))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))

(unless is-cygwin
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (if (or is-mswin is-mac)
      (setq inferior-lisp-program "clisp")
    (setq inferior-lisp-program "clbuild lisp")))

(show-paren-mode 1)

(provide 'lisp-setup)

;;; lisp-setup.el ends here
