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
(require 'os-setup)
(require 'coding-setup)
(require 'misc-setup)

(require 'server)
(setq server-auth-dir
	  (expand-file-name "server" user-emacs-directory))
(setq server-name "server")
(unless (server-running-p) (server-start))

;;; init.el ends here
