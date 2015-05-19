;;; init.el --- The init file "emacs-mine" config.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(let* ((load-dir (file-name-directory load-file-name))
       (setup-dir (expand-file-name "setup" load-dir)))
  (add-to-list 'load-path setup-dir))

(require 'core-setup)
(require 'syntax-check-setup)
(require 'completion-setup)
(require 'projectile-setup)
(require 'lisp-setup)
(require 'snippet-setup)
(require 'git-setup)
(require 'binding-setup)
(require 'theme-setup)
(require 'misc-setup)

;;; init.el ends here
