;;; lisp-setup.el --- Lisp setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'var-setup)

(unless is-cygwin
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (if (or is-mswin is-mac)
      (setq inferior-lisp-program "clisp")
    (setq inferior-lisp-program "clbuild lisp")))

(require 'use-package)

(use-package cider)

(use-package paredit
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode)))
  (add-hook 'lisp-mode-hook (lambda () (paredit-mode)))
  (add-hook 'clojure-mode-hook (lambda () (paredit-mode))))

(provide 'lisp-setup)

;;; lisp-setup.el ends here
