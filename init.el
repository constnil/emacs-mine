;;; .emacs --- The dot emacs file

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(defconst default-config "mine")
(defvar config-suit-name (getenv "EMACS_CONFIG"))
(let ((config-list '("prelude" "live" "space" "mine")))
  (unless (member config-suit-name config-list)
    (message "$EMACS_CONFIG not specified, use default: %s"
             default-config)
    (setq config-suit-name default-config)))

(setq user-emacs-directory
      (expand-file-name (format "~/.emacs.d/%s/" config-suit-name)))
(add-to-list 'load-path user-emacs-directory)

(require 'server)
(setq server-auth-dir
	  (expand-file-name "server" user-emacs-directory))
(setq server-name "server")

(require 'package)
(setq package-user-dir
      (expand-file-name "elpa" user-emacs-directory))

(message "load emacs using configuration: \"%s\" (%s) - begin"
         config-suit-name user-emacs-directory)
(load (expand-file-name "init.el" user-emacs-directory))
(message "load emacs using configuration: \"%s\" - end"
         config-suit-name)

;;; .emacs ends here
