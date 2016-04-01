;;; init.el --- Emacs initial file

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(defconst default-suit "mine")
(defvar config-suit (getenv "EMACS_CONFIG"))
(let ((config-list '("prelude" "live" "space" "mine")))
  (unless (member config-suit config-list)
    (message "$EMACS_CONFIG not specified, use default: %s"
             default-suit)
    (setq config-suit default-suit)))
(defvar config-root (expand-file-name config-suit user-emacs-directory))
(add-to-list 'load-path config-root)

(require 'server)
(setq server-auth-dir
	  (expand-file-name "server" user-emacs-directory))
(setq server-name "server")

(require 'package)
(setq package-user-dir
      (expand-file-name "elpa" user-emacs-directory))

(message "config suit \"%s\" start loading" config-suit)
(load (expand-file-name "init.el" config-root))
(message "config suit \"%s\" loaded" config-suit)

;;; init.el ends here
