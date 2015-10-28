;;; server-setup.el --- Emacs server setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'var-setup)
(when is-mswin
  (require 'server)
  (setq server-auth-dir
		(expand-file-name "server" user-emacs-directory))
  (setq server-name "server")
  (unless (server-running-p)
	(message "Starting emacs server...")
	(server-start)
	(message "Emacs server started!")))

(provide 'server-setup)

;;; server-setup.el ends here
