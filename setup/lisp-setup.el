
;;; lisp-setup.el --- Lisp setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'dot-emacs-vars)
(require 'dot-emacs-funcs)

(install-packages '(paredit))

(unless is-cygwin
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (if (or is-mswin is-mac)
      (setq inferior-lisp-program "clisp")
    (setq inferior-lisp-program "clbuild lisp")))

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode)))
(add-hook 'lisp-mode-hook (lambda () (paredit-mode)))

(provide 'lisp-setup)

;;; lisp-setup.el ends here
