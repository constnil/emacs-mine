;;; magit-setup.el --- Magit setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'dot-emacs-funcs)

(progn
  (install-package 'magit)
  (setq magit-last-seen-setup-instructions "1.4.0"))

(provide 'magit-setup)

;;; magit-setup.el ends here
