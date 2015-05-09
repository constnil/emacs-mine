;;; init.el --- The init file "emacs-mine" config.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'package)

(defun install-pkg (pkg)
  "Install PKG."
  (unless (package-installed-p pkg)
    (unless (assoc pkg package-archive-contents)
      (package-refresh-contents))
    (package-install pkg)))

(install-pkg 'use-package)
(install-pkg 'better-defaults)

(let* ((current-dir (file-name-directory load-file-name))
       (setup-dir (expand-file-name "setup" current-dir)))
  (add-to-list 'load-path setup-dir))

;(require 'minibuf-setup)
;(require 'flycheck-setup)
;(require 'acejump-setup)
;(require 'projectile-setup)
;(require 'magit-setup)
;(require 'lisp-setup)
(require 'evil-setup)
;(require 'misc-setup)

(message "MINE config load finished!")

;;; init.el ends here
